import 'package:flutter/material.dart';
import 'package:vlt_africa/hero_page.dart';
import 'package:vlt_africa/responsive_grid.dart';

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
          title: const Text('VLT Academy'),
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
                  const SizedBox(width: 20),
                  IconButton(
                    icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
                    onPressed: () {
                      setState(() {
                        isDarkMode = !isDarkMode;
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.person),
                    onPressed: () {
                      // TODO: Implement profile navigation
                    },
                  ),
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
                  HeroPage(isMobile: isMobile),

                  // Categories Section
                  ResponsiveGrid(isMobile: isMobile),

                  // Featured Courses Section
                  Padding(
                    padding: EdgeInsets.all(isMobile ? 16 : 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Featured E-book Courses',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // SizedBox(
                        //   height: isMobile ? 250 : 300,
                        //   child: ListView(
                        //     scrollDirection: Axis.horizontal,
                        //     children: [
                        //       CorporateCover(isDarkMode: isDarkMode),
                        //       const SizedBox(width: 20),
                        //       CorporateCover(isDarkMode: isDarkMode),
                        //       const SizedBox(width: 20),
                        //       CorporateCover(isDarkMode: isDarkMode),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),

                  // Popular Courses Section
                  Padding(
                    padding: EdgeInsets.all(isMobile ? 16 : 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Popular Mentorship Courses',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        isMobile
                            ? ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return Card(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    child: ListTile(
                                      leading:
                                          const Icon(Icons.play_circle_outline),
                                      title: Text('Course ${index + 1}'),
                                      subtitle:
                                          const Text('Beginner to Advanced'),
                                      trailing:
                                          const Icon(Icons.arrow_forward_ios),
                                      onTap: () {
                                        // TODO: Navigate to course details
                                      },
                                    ),
                                  );
                                },
                              )
                            : GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                  childAspectRatio: 1.5,
                                ),
                                itemCount: 6,
                                itemBuilder: (context, index) {
                                  return Card(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary
                                                  .withOpacity(0.1),
                                              borderRadius:
                                                  const BorderRadius.vertical(
                                                top: Radius.circular(4),
                                              ),
                                            ),
                                            child: const Center(
                                              child: Icon(
                                                  Icons.play_circle_outline,
                                                  size: 40),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Course ${index + 1}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const Text(
                                                  'Beginner to Advanced'),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                      ],
                    ),
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
          const DrawerHeader(
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
                color: Colors.white,
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
          ListTile(
            leading: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
            title: Text(isDarkMode ? 'Light Mode' : 'Dark Mode'),
            onTap: () {
              setState(() {
                isDarkMode = !isDarkMode;
              });
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              // TODO: Navigate to profile
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
