import 'package:doctor_ai/screens/chatbot.dart';
import 'package:doctor_ai/screens/knowledge.dart';
import 'package:doctor_ai/screens/profile.dart';
import 'package:doctor_ai/screens/scan.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const ScanScreen(),
    const KnowledgeScreen(),
    const ChatbotScreen(),
    const ProfileScreen(),
  ];

  void _navigateTo(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        backgroundColor: Colors.transparent,
        color: Colors.green,
        buttonBackgroundColor: Colors.green,
        height: 70,
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.camera_alt, size: 30, color: Colors.white),
          Icon(Icons.menu_book, size: 30, color: Colors.white),
          Icon(Icons.chat, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        onTap: (index) => _navigateTo(index),
      ),
    );
  }
}

/// ------------------- DASHBOARD SCREEN -------------------
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final parentState = context.findAncestorStateOfType<_HomeScreenState>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Logo + App Name
          Padding(
            padding: const EdgeInsets.only(top: 48.0, bottom: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    parentState?._navigateTo(4); // Go to Profile tab
                  },
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.green.shade700,
                    child: const Icon(Icons.agriculture,
                        size: 34, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  "Doctor AI👨‍🌾",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          // Welcome Card
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Hi, Farmer👋\nScan leaves, ask AgriBot, and explore crop disease information.",
                style: TextStyle(fontSize: 17),
              ),
            ),
          ),
          const SizedBox(height: 20),

          const Text("Quick Access",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),

          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                _QuickTile(
                    icon: Icons.camera_alt,
                    title: "Scan Leaf",
                    onTap: () => parentState?._navigateTo(1)),
                _QuickTile(
                    icon: Icons.chat,
                    title: "Chatbot",
                    onTap: () => parentState?._navigateTo(3)),
                _QuickTile(
                    icon: Icons.menu_book,
                    title: "Knowledge",
                    onTap: () => parentState?._navigateTo(2)),
                _QuickTile(
                    icon: Icons.person,
                    title: "Profile",
                    onTap: () => parentState?._navigateTo(4)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// ------------------- QUICK TILE WIDGET -------------------
class _QuickTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _QuickTile(
      {required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 36, color: Colors.green),
              const SizedBox(height: 12),
              Text(title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
