import 'package:flutter/material.dart';
import 'package:vlt_africa/responsive.dart';

class Team extends StatelessWidget {
  const Team({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Responsive.isMobile(context)?5.0:20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Responsive.isMobile(context)?16.0:32.0),
            child: Text(
                    'Meet Our Team',
                    style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
          ),
                const SizedBox(height: 20),
                // very basic example that scrolls children vertically from -250px to +250px
          SizedBox(
            height: Responsive.isMobile(context)? 140:250,
            child: 
                
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            child: _AutoScrollingListView(
              itemCount: 8,
              itemBuilder: (context, index) {
              final members = [
                {
                'name': 'John Doe',
                'role': 'Founder & CEO',
                'imageUrl': 'https://picsum.photos/400/301',
                },
                {
                'name': 'Jane Smith',
                'role': 'CTO',
                'imageUrl': 'https://picsum.photos/400/302',
                },
                {
                'name': 'Alice Johnson',
                'role': 'Lead Developer',
                'imageUrl': 'https://picsum.photos/400/303',
                },
                {
                'name': 'Bob Brown',
                'role': 'UI/UX Designer',
                'imageUrl': 'https://picsum.photos/400/304',
                },
                {
                'name': 'John Doe',
                'role': 'Founder & CEO',
                'imageUrl': 'https://picsum.photos/400/305',
                },
                {
                'name': 'Jane Smith',
                'role': 'CTO',
                'imageUrl': 'https://picsum.photos/400/306',
                },
                {
                'name': 'Alice Johnson',
                'role': 'Lead Developer',
                'imageUrl': 'https://picsum.photos/400/307',
                },
                {
                'name': 'Bob Brown',
                'role': 'UI/UX Designer',
                'imageUrl': 'https://picsum.photos/400/308',
                },
              ];
              return Padding(
                padding: EdgeInsets.only(
                right: index == members.length - 1
                  ? 0
                  : Responsive.isMobile(context) ? 16.0 : 50.0,
                ),
                child: _buildTeamMember(
                context: context,
                name: members[index]['name']!,
                role: members[index]['role']!,
                imageUrl: members[index]['imageUrl']!,
                ),
              );
              },
            ),
            ),
          ),]),
    
            );
  }
  
  Widget _buildTeamMember({
    required String name,
    required String role,
    required String imageUrl,
    required BuildContext context,
  }) {
    return Column(
      children: [
        CircleAvatar(
          radius: Responsive.isMobile(context)? 40 : 60,
          backgroundImage: NetworkImage(imageUrl),
          child: imageUrl.isEmpty
              ? const Icon(Icons.person, size: 40, color: Colors.grey)
              : null,
        ),
        const SizedBox(height: 8),
        Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(role, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class _AutoScrollingListView extends StatefulWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  const _AutoScrollingListView({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  State<_AutoScrollingListView> createState() => _AutoScrollingListViewState();
}

class _AutoScrollingListViewState extends State<_AutoScrollingListView> {
  late final ScrollController _controller;
  int _currentIndex = 0;
  late final Duration _scrollDuration;
  late final Duration _pauseDuration;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _scrollDuration = const Duration(milliseconds: 600);
    _pauseDuration = const Duration(seconds: 2);
    WidgetsBinding.instance.addPostFrameCallback((_) => _autoScroll());
  }

  void _autoScroll() async {
    while (mounted) {
      await Future.delayed(_pauseDuration);
      if (!mounted) break;
      _currentIndex = (_currentIndex + 1) % widget.itemCount;
      _controller.animateTo(
        _currentIndex * 220.0, // Adjust item width as needed
        duration: _scrollDuration,
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _controller,
      scrollDirection: Axis.horizontal,
      itemCount: widget.itemCount,
      itemBuilder: widget.itemBuilder,
    );
  }
}