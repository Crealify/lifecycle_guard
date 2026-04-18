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

  /// The method every platform MUST implement to run a secure task
  Future<void> runSecureTask({
    required String id, 
    Map<String, dynamic>? payload,
  }) {
    throw UnimplementedError('runSecureTask() has not been implemented.');
  }

  /// The method to stop the secure task and release resources
  Future<void> stopSecureTask() {
    throw UnimplementedError('stopSecureTask() has not been implemented.');
  }
}

class MethodChannelLifecycleGuard extends LifecycleGuardPlatform {
  final methodChannel = const MethodChannel('lifecycle_guard');

  @override
  Future<void> runSecureTask({
    required String id, 
    Map<String, dynamic>? payload,
  }) async {
    await methodChannel.invokeMethod<void>('startBackgroundSync', {
      'taskId': id,
      'data': payload ?? {},
    });
  }

  @override
  Future<void> stopSecureTask() async {
    await methodChannel.invokeMethod<void>('stopSecureTask');
  }
}
