import 'package:flutter/material.dart';
import 'package:vlt_africa/botton.dart';
import 'package:vlt_africa/courses_page.dart';
import 'package:vlt_africa/dashboard.dart';
import 'package:vlt_africa/helper.dart';
import 'package:vlt_africa/hero_page.dart';
import 'package:vlt_africa/how_vlt_works.dart';
import 'package:vlt_africa/login_page.dart';
import 'package:vlt_africa/register_page.dart';
import 'package:vlt_africa/why_choose_vlt.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isDarkMode = false;
  int _selectedIndex = 0;
  bool isMobile = false;
  bool isLoggedIn = false;
  ScrollController _scrollController = ScrollController();

  double _startDragY = 0.0;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isLoggedIn = prefs.getBool('is_logged_in') ?? false;
    });
  }

  Future<void> _handleLogout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_logged_in', false);
    await prefs.remove('user_email');
    setState(() {
      isLoggedIn = false;
    });
  }

  void _startDrag(DragStartDetails details) {
    _startDragY = details.globalPosition.dy;
  }

  void _updateScroll(DragUpdateDetails details) {
    final delta = details.globalPosition.dy - _startDragY;
    _scrollController.jumpTo(_scrollController.offset - delta);
    _startDragY = details.globalPosition.dy; // Update the start position
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Don't forget to dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Check screen size
    final screenWidth = MediaQuery.of(context).size.width;
    isMobile = screenWidth < 600;

    return Scaffold(
        appBar: AppBar(
          title: const Text('VLT BUSINESS ACADEMY'),
          actions: !isMobile
              ? [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                    child: Text(
                      'Home',
                      style: TextStyle(
                        color: _selectedIndex == 0
                            ? Theme.of(context).colorScheme.primary
                            : Colors.grey,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                    child: Text(
                      'Courses',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Saved',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  const SizedBox(width: 20),
                  HelperButton(
                      onTap: () async {
                        if (isLoggedIn) {
                          await _handleLogout();
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      LoginPage(isMobile: isMobile)));
                        }
                      },
                      title: isLoggedIn ? 'Logout' : 'Member Login',
                      btnColor: Colors.white,
                      titleColor: Colors.black),
                  SizedBox(width: 10),
                  if (isLoggedIn == false)
                    HelperButton(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      RegisterPage(isMobile: isMobile)));
                        },
                        title: 'Get Started',
                        btnColor: Colors.amber,
                        titleColor: Colors.black),
                  SizedBox(width: 10),
                ]
              : [],
        ),
        drawer: isMobile ? _buildMobileDrawer() : null,
        body: MouseRegion(
          onEnter: (_) {
            // Optional: Change cursor to indicate draggable area
            SystemMouseCursors.move;
          },
          onExit: (_) {
            // Optional: Reset cursor
            SystemMouseCursors.basic;
          },
          child: GestureDetector(
            onPanStart: (details) {
              // Start dragging
              _startDrag(details);
            },
            onPanUpdate: (details) {
              // Update scroll position based on drag
              _updateScroll(details);
            },
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hero Section
                  if (_selectedIndex == 0)
                    Column(
                      children: [
                        HeroPage(isMobile: isMobile),
                        SizedBox(height: 80),
                        HowVltWorks(isMobile: isMobile),
                        WhyChooseVlt(isMobile: isMobile)
                      ],
                    ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildMobileDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(),
            child: Text(
              textAlign: TextAlign.center,
              'VLT AFRICA',
              style: TextStyle(
                color: CustomHexColors.fromHex('#d3efe9'),
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            selected: _selectedIndex == 0,
            onTap: () {
              setState(() {
                _selectedIndex = 0;
              });
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Courses'),
            selected: _selectedIndex == 1,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CoursesPage(
                            isMobile: isMobile,
                            categories: [],
                          )));
            },
          ),
          ListTile(
            leading: const Icon(Icons.bookmark),
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Dashboard(isMobile: isMobile)));
            },
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
            child: HelperButton(
                onTap: () async {
                  if (isLoggedIn) {
                    await _handleLogout();
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LoginPage(isMobile: isMobile)));
                  }
                },
                title: isLoggedIn ? 'Logout' : 'Member Login',
                btnColor: Colors.white,
                titleColor: Colors.black),
          ),
          if(isLoggedIn!=true)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
            child: HelperButton(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterPage(isMobile: isMobile)));
                },
                title: 'Get Started',
                btnColor: Colors.amber,
                titleColor: Colors.black),
          ),
        ],
      ),
    );
  }
}
