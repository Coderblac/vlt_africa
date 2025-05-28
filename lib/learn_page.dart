import 'package:flutter/material.dart';

class LearningPage extends StatefulWidget {
  const LearningPage({super.key});

  @override
  State<LearningPage> createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: SizedBox.shrink(),
        title: Text('Courses'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.pink,
            height: 250,
            width: 400,
          ),
          TextButton(onPressed: (){}, child:
          Text('Overview')),
          SizedBox(width: 20),
          TextButton(onPressed: (){}, child:
          Text('Lessons')),
          SizedBox(width: 20),
          TextButton(onPressed: (){}, child:
          Text('Reviews')),
          Divider(),
        ],
      ),
    );
  }
}