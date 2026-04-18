import 'package:flutter/material.dart';
import 'package:lifecycle_guard/lifecycle_guard.dart';

/// ---------------------------------------------------------------------------
/// Lifecycle Guard - Full Demo Example
/// 
/// This example demonstrates how to use the [LifecycleGuard] plugin to 
/// ensure that critical background tasks (like data syncing) survive 
/// even when the user swipes the app away from the multitasking view.
/// ---------------------------------------------------------------------------

void main() {
  // Always ensure widgets are initialized before calling native plugins
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const LifecycleGuardDemoApp());
}

class LifecycleGuardDemoApp extends StatelessWidget {
  const LifecycleGuardDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'lifecycle_guard Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF090C12),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF58A6FF),
          secondary: Color(0xFF3FB950),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool _isRunning = false;
  String _statusText = 'Idle';
  Color _statusColor = const Color(0xFF8B949E);
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    // Animation for the "Guarded" state UI
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _pulseAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  /// 🚀 THE CORE LOGIC: Starting a Secure Task
  Future<void> _startTask() async {
    setState(() {
      _isRunning = true;
      _statusText = 'Lifecycle Guard: Active log protection...';
      _statusColor = const Color(0xFF58A6FF);
    });
    _pulseController.repeat(reverse: true);

    try {
      // 🛡️ [LifecycleGuard.runSecureTask] is the main entry point.
      // Once this is called, a native service starts (Foreground on Android, 
      // BGTask on iOS) which wraps your logic.
      await LifecycleGuard.runSecureTask(
        id: "demo_sync_${DateTime.now().millisecondsSinceEpoch}",
        payload: {
          "source": "example_app",
          "timestamp": DateTime.now().toIso8601String(),
          "retry": true, // Example custom flag
        },
      );
      
      if (!mounted) return;
      
      setState(() {
        _statusText = '🛡️ Guarding active! You can swipe app now.';
        _statusColor = const Color(0xFF3FB950);
      });
      
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _statusText = '❌ Error: ${e.toString()}';
        _statusColor = const Color(0xFFF85149);
        _isRunning = false;
      });
      _pulseController.stop();
    }
  }

  /// 🛑 STOP THE GUARD: Releasing Resources
  Future<void> _stopTask() async {
    try {
      await LifecycleGuard.stopSecureTask();
      
      if (!mounted) return;
      
      setState(() {
        _isRunning = false;
        _statusText = '✅ Guard stopped. Resources released.';
        _statusColor = const Color(0xFF8B949E);
      });
      _pulseController.stop();
      _pulseController.reset();
      
    } catch (e) {
      debugPrint("Error stopping guard: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF1A73E8), Color(0xFF58A6FF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network('https://raw.githubusercontent.com/Crealify/lifecycle_guard/main/doc/logo.png', width: 28),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'lifecycle_guard',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFFE6EDF3),
                        ),
                      ),
                      Text(
                        'by Crealify',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF58A6FF),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // Educational Tagline
              const Text(
                'Background tasks\nsurvive. Always.',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFFE6EDF3),
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Once you start the guard, your task will continue even if you swipe the app away from the multitasking view.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF8B949E),
                ),
              ),

              const SizedBox(height: 32),

              // Visual Demo Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF161B22),
                  border: Border.all(color: const Color(0xFF30363D)),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '🎬 Instructions',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF58A6FF),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '1. Click Start Secure Task\n2. Swipe your app away immediately\n3. The background sync continues uninterrupted!',
                      style: TextStyle(fontSize: 13, color: Color(0xFF8B949E), height: 1.5),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Feature Badges
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _badge('Android 15+', '🤖', const Color(0xFF3FB950)),
                  _badge('iOS Ready', '🍎', const Color(0xFF58A6FF)),
                  _badge('Zero Data Loss', '💾', const Color(0xFFD29922)),
                ],
              ),

              const SizedBox(height: 28),

              // Task Status Visualizer
              AnimatedBuilder(
                animation: _pulseAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _isRunning ? _pulseAnimation.value : 1.0,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF161B22),
                        border: Border.all(
                          color: _isRunning
                              ? const Color(0xFF58A6FF)
                              : const Color(0xFF30363D),
                          width: _isRunning ? 1.5 : 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Current Engine Status',
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFF8B949E),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _statusText,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: _statusColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 16),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _isRunning ? null : _startTask,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1F6FEB),
                        foregroundColor: Colors.white,
                        disabledBackgroundColor: const Color(0xFF21262D),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        _isRunning ? '🛡️ Guard Active' : '▶  Start Task',
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  if (_isRunning) ...[
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _stopTask,
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: const Color(0xFFF85149).withValues(alpha: 0.5)),
                          foregroundColor: const Color(0xFFF85149),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text('🛑 Stop Guard'),
                      ),
                    ),
                  ],
                ],
              ),

              const SizedBox(height: 32),

              // Code Snippet for quick copy
              const Text(
                'Copy-Paste Snippet',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white70),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFF0D1117),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFF30363D)),
                ),
                child: const SelectableText(
                  '// Start the protection\n'
                  'await LifecycleGuard.runSecureTask(id: "sync");\n\n'
                  '// Stop when finished\n'
                  'await LifecycleGuard.stopSecureTask();',
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 11,
                    color: Color(0xFF79C0FF),
                    height: 1.6,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Footer
              const Center(
                child: Text(
                  '⭐ Star on GitHub · Open to collaborate\ngithub.com/Crealify/lifecycle_guard',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF8B949E),
                    height: 1.6,
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget _badge(String label, String icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        border: Border.all(color: color.withValues(alpha: 0.3)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(icon, style: const TextStyle(fontSize: 12)),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
