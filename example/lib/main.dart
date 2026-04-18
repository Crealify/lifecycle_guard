import 'package:flutter/material.dart';
import 'package:lifecycle_guard/lifecycle_guard.dart';

void main() {
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

  Future<void> _startTask() async {
    setState(() {
      _isRunning = true;
      _statusText = 'Lifecycle Guard: Active log protection...';
      _statusColor = const Color(0xFF58A6FF);
    });
    _pulseController.repeat(reverse: true);

    try {
      await LifecycleGuard.runSecureTask(
        id: "demo_sync_${DateTime.now().millisecondsSinceEpoch}",
        payload: {
          "source": "example_app",
          "timestamp": DateTime.now().toIso8601String(),
          "retry": true,
        },
      );
      if (!mounted) return;
      setState(() {
        _statusText = '✅ Task dispatched successfully!';
        _statusColor = const Color(0xFF3FB950);
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _statusText = '❌ Error: ${e.toString()}';
        _statusColor = const Color(0xFFF85149);
      });
    } finally {
      _pulseController.stop();
      _pulseController.reset();
      setState(() => _isRunning = false);
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
              // Header
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
                      child: Image.network('https://raw.githubusercontent.com/Crealify/lifecycle_guard/main/doc/logo.png', width: 28),
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

              // Tagline
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
                'Even if the user swipes your app away.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF8B949E),
                ),
              ),

              const SizedBox(height: 32),

              // Demo video card
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
                      '🎬 Demo',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF58A6FF),
                      ),
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        height: 200,
                        color: const Color(0xFF090C12),
                        child: const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('▶', style: TextStyle(fontSize: 40, color: Color(0xFF58A6FF))),
                              SizedBox(height: 8),
                              Text(
                                'Watch: App Killed → Guard Activates',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF8B949E),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '📺 Watch the full demo at github.com/Crealify/lifecycle_guard',
                      style: TextStyle(fontSize: 11, color: Color(0xFF8B949E)),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Feature badges
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _badge('Android 15+', '🤖', const Color(0xFF3FB950)),
                  _badge('iOS Ready', '🍎', const Color(0xFF58A6FF)),
                  _badge('Zero Data Loss', '💾', const Color(0xFFD29922)),
                  _badge('30s Setup', '⚡', const Color(0xFF79C0FF)),
                ],
              ),

              const SizedBox(height: 28),

              // Status card
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
                            'Task Status',
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

              // Action button
              SizedBox(
                width: double.infinity,
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
                    _isRunning
                        ? 'Guard Running...'
                        : '▶  Start Secure Task',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // Code snippet
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFF0D1117),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFF30363D)),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Usage', style: TextStyle(fontSize: 11, color: Color(0xFF8B949E))),
                    SizedBox(height: 8),
                    SelectableText(
                      'await LifecycleGuard.runSecureTask(\n'
                      '  id: "sync_001",\n'
                      '  payload: {"retry": true},\n'
                      ');',
                      style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 12,
                        color: Color(0xFF79C0FF),
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

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
