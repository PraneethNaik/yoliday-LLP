import 'package:flutter/material.dart';
import 'portfolio_screen.dart';
import '../widgets/bottom_navbar_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 1;

  final List<Widget> screens = const [
    Scaffold(body: Center(child: Text("Home Page"))),
    PortfolioScreen(),
    Scaffold(body: Center(child: Text("Input Page"))),
    Scaffold(body: Center(child: Text("Profile Page"))),
  ];

  void onNavTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavbarWidget(
        selectedIndex: selectedIndex,
        onItemTap: onNavTap,
      ),
    );
  }
}
