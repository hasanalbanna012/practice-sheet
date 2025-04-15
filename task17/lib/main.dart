import 'package:flutter/material.dart';

void main() {
  runApp(const SettingsApp());
}

class SettingsApp extends StatefulWidget {
  const SettingsApp({super.key});

  @override
  State<SettingsApp> createState() => _SettingsAppState();
}

class _SettingsAppState extends State<SettingsApp> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings Screen',
      theme: _isDarkMode ? ThemeData.dark(useMaterial3: true) : ThemeData.light(useMaterial3: true),
      home: SettingsScreen(
        isDarkMode: _isDarkMode,
        onThemeToggle: (value) {
          setState(() {
            _isDarkMode = value;
          });
        },
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeToggle;

  const SettingsScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            subtitle: const Text('Enable or disable dark theme'),
            value: isDarkMode,
            onChanged: onThemeToggle,
            secondary: const Icon(Icons.dark_mode),
          ),
        ],
      ),
    );
  }
}
