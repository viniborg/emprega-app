import 'package:empregos_app/view/qualification_page.dart';
import 'package:flutter/material.dart';
import '../widgets/filter_drawer.dart';
import 'job_page.dart';
import 'notification_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  Map<String, bool> selectedCities = {};
  Map<String, bool> selectedAreas = {};
  Map<String, bool> selectedContracts = {};

  final List<Widget> _pages = [
    const JobsPage(),
    const QualificationsPage(),
    const NotificationPage(),
  ];

  final List<String> _titles = [
    'Vagas',
    'Qualificações',
    'Notificações',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _openFilterDrawer(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
  }

  void _applyFilters(Map<String, bool> cities, Map<String, bool> areas, Map<String, bool> contracts) {
    setState(() {
      selectedCities = cities;
      selectedAreas = areas;
      selectedContracts = contracts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        centerTitle: true,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.filter_list, size: 30),
              onPressed: () => _openFilterDrawer(context),
            ),
          ),
          IconButton(
            icon: const CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(
                'https://images.vexels.com/content/145908/preview/male-avatar-maker-2a7919.png',
              ),
              backgroundColor: Colors.transparent,
            ),
            onPressed: () => Navigator.pushNamed(context, '/profile'),
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Vagas'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Qualificações'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notificações'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      endDrawer: FilterDrawer(
        applyFilters: _applyFilters,
      ),
    );
  }
}
