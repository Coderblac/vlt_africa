import 'package:flutter/material.dart';
import 'package:vlt_africa/responsive.dart';

class HeroPageVideoCard extends StatelessWidget {
  const HeroPageVideoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: Responsive.isMobile(context)? 300: 500,
        height: Responsive.isMobile(context)? 180: 300,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                'Introduction Video',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: Responsive.isMobile(context)? 14 : 20,
                ),
              ),
            ),
            // Placeholder for video player widget
            Container(
              height: Responsive.isMobile(context)? 130 : 220,
              width: Responsive.isMobile(context)? 300 : 500,
              color: Colors.grey[300],
              child: Center(child: Text('Video Player Placeholder')),
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}