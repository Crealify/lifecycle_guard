import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:flutter/services.dart';

abstract class LifecycleGuardPlatform extends PlatformInterface {
  LifecycleGuardPlatform() : super(token: _token);
  static final Object _token = Object();
  
  static LifecycleGuardPlatform _instance = MethodChannelLifecycleGuard();
  static LifecycleGuardPlatform get instance => _instance;

  static set instance(LifecycleGuardPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  // The method every platform MUST implement
  Future<void> startBackgroundSync(String taskId, Map<String, dynamic> data) {
    throw UnimplementedError('startBackgroundSync() has not been implemented.');
  }
}

class MethodChannelLifecycleGuard extends LifecycleGuardPlatform {
  final methodChannel = const MethodChannel('lifecycle_guard');

  @override
  Future<void> startBackgroundSync(String taskId, Map<String, dynamic> data) async {
    await methodChannel.invokeMethod<void>('startBackgroundSync', {
      'taskId': taskId,
      'data': data,
    });
  }
}
