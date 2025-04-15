import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Drawer Animation',
      theme: ThemeData(useMaterial3: true),
      home: const CustomDrawerScreen(),
    );
  }
}

class CustomDrawerScreen extends StatefulWidget {
  const CustomDrawerScreen({super.key});

  @override
  State<CustomDrawerScreen> createState() => _CustomDrawerScreenState();
}

class _CustomDrawerScreenState extends State<CustomDrawerScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleDrawer() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Drawer Animation')),
      body: Stack(
        children: [
          // Main Content
          Center(
            child: ElevatedButton(
              onPressed: _toggleDrawer,
              child: const Text('Open Drawer'),
            ),
          ),

          // Drawer - Animated Slide from Left
          SlideTransition(
            position: _slideAnimation,
            child: Material(
              color: Colors.blueGrey.withOpacity(0.9),
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    ListTile(
                      title: const Text(
                        'Home',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text(
                        'Settings',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text(
                        'Profile',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
