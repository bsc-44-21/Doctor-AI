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
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

/// ------------------- DASHBOARD SCREEN -------------------
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Logo + App Name
          Padding(
            padding: const EdgeInsets.only(top: 32.0, bottom: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreen()),
                    );
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.green.shade700,
                    child:
                        Icon(Icons.agriculture, size: 40, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 12),
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
              children: const [
                _QuickTile(icon: Icons.camera_alt, title: "Scan Leaf"),
                _QuickTile(icon: Icons.chat, title: "Chatbot"),
                _QuickTile(icon: Icons.menu_book, title: "Knowledge"),
                _QuickTile(icon: Icons.person, title: "Profile"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// ------------------- SCREENS FOR EACH TAB -------------------
class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Scan Screen"));
  }
}

class KnowledgeScreen extends StatelessWidget {
  const KnowledgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Knowledge Screen"));
  }
}

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Chatbot Screen"));
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Profile Screen"));
  }
}

/// ------------------- QUICK TILE WIDGET -------------------
class _QuickTile extends StatelessWidget {
  final IconData icon;
  final String title;

  const _QuickTile({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          if (title == 'Scan Leaf') {
            Navigator.of(context).pushNamed('/scan');
          } else if (title == 'Chatbot') {
            Navigator.of(context).pushNamed('/chatbot');
          } else if (title == 'Knowledge') {
            Navigator.of(context).pushNamed('/knowledge');
          } else if (title == 'Profile') {
            Navigator.of(context).pushNamed('/profile');
          }
        },
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
