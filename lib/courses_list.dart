import 'package:flutter/material.dart';

class CoursesList extends StatelessWidget {
  final bool isMobile;
  const CoursesList({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: isMobile ? 1 * 0.1 : 1 * 0.1,
        ),
        itemCount: 3,
        itemBuilder: (context, index) {
          return _buildLearningVideoCard(isMobile: isMobile);
        },
      ),
    );
  }
    Widget _buildLearningVideoCard({required bool isMobile}) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            height: isMobile ? 80 : 200,
            width: 350,
            color: Colors.black,
            child: Icon(Icons.play_circle),
          ),
        ),
        SizedBox(
          height: isMobile ? 40 : 300,
          width: 350,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textAlign: TextAlign.left,
                'Course',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: isMobile ? 12 : 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                textAlign: TextAlign.left,
                '1h 10 min',
                style: TextStyle(
                  fontSize: isMobile ? 10 : 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}