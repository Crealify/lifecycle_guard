package com.crealify.lifecycle_guard_android

import android.content.Context
import android.content.Intent
import androidx.core.content.ContextCompat
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class LifecycleGuardPlugin: FlutterPlugin, MethodCallHandler {
    private lateinit var channel : MethodChannel
    private lateinit var context: Context

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "lifecycle_guard")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "startBackgroundSync") {
            val intent = Intent(context, LifecycleService::class.java)
            val taskId = call.argument<String>("taskId")
            val data = call.argument<Map<String, Any>>("data")
            
            intent.putExtra("taskId", taskId)
            intent.putExtra("task_data", HashMap(data ?: emptyMap<String, Any>()))
            
            // Android 15+ requirement: startForegroundService
            ContextCompat.startForegroundService(context, intent)
            result.success(null)
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
