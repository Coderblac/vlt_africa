import 'package:flutter/material.dart';
import 'package:vlt_africa/botton.dart';
import 'package:vlt_africa/dashboard.dart';
import 'package:vlt_africa/helper.dart';
import 'package:vlt_africa/hero_page.dart';
import 'package:vlt_africa/how_vlt_works.dart';
import 'package:vlt_africa/learn_page.dart';
import 'package:vlt_africa/why_choose_vlt.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isDarkMode = false;
  int _selectedIndex = 0;
  bool isMobile = false;
  ScrollController _scrollController = ScrollController();

  double _startDragY = 0.0;

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
                        color: _selectedIndex == 1
                            ? Theme.of(context).colorScheme.primary
                            : Colors.grey,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 2;
                      });
                    },
                    child: Text(
                      'Saved',
                      style: TextStyle(
                        color: _selectedIndex == 2
                            ? Theme.of(context).colorScheme.primary
                            : Colors.grey,
                      ),
                    ),
                  ),
                  // TextButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       _selectedIndex = 3;
                  //     });
                  //   },
                  //   child: Text(
                  //     'Dashboard',
                  //     style: TextStyle(
                  //       color: _selectedIndex == 3
                  //           ? Theme.of(context).colorScheme.primary
                  //           : Colors.grey,
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(width: 20),
                  HelperButton(onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)
                   =>Dashboard(isMobile: isMobile)));
                  }, title: 'Member Login', btnColor: Colors.white, titleColor: Colors.black),
                  SizedBox(width: 10),
                  HelperButton(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)
                    =>Dashboard(isMobile: isMobile)));
                  }, title: 'Get Started', btnColor: Colors.amber, titleColor: Colors.black),
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
                  if (_selectedIndex == 0) Column(
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
            decoration: BoxDecoration(
                // gradient: LinearGradient(
                //   begin: Alignment.topLeft,
                //   end: Alignment.bottomRight,
                //   colors: [Colors.deepPurple, Colors.purple],
                // ),
                ),
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
              setState(() {
                _selectedIndex = 1;
              });
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.bookmark),
            title: const Text('Saved'),
            selected: _selectedIndex == 2,
            onTap: () {
              setState(() {
                _selectedIndex = 2;
              });
              Navigator.pop(context);
            },
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
            child: HelperButton(onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)
                     =>Dashboard(isMobile: isMobile)));
                    }, title: 'Member Login', btnColor: Colors.white, titleColor: Colors.black),
          ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
                    child: HelperButton(onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)
                      =>Dashboard(isMobile: isMobile)));
                    }, title: 'Get Started', btnColor: Colors.amber, titleColor: Colors.black),
                  ),

        ],
      ),
    );
  }
}
