import 'package:flutter/material.dart';
import 'package:vlt_africa/helper.dart';

class HeroPage extends StatefulWidget {
  final bool isMobile;
  const HeroPage({super.key, required this.isMobile});

  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  @override
  Widget build(BuildContext context) {
    return  Container(
              width: double.infinity,
              padding: EdgeInsets.all(widget.isMobile ? 16 : 20),
              decoration: BoxDecoration(
                color: CustomHexColors.fromHex('#2a3935')
                // gradient: LinearGradient(
                //   begin: Alignment.topLeft,
                //   end: Alignment.bottomRight,
                //   colors: [
                //     Theme.of(context).colorScheme.primary,
                //     Theme.of(context).colorScheme.secondary,
                //   ],
                // ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    'Welcome to VLT Academy',
                    style: TextStyle(
                      fontSize: widget.isMobile ? 24 : 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    textAlign: TextAlign.center,
                    'Start your learning journey today',
                    style: TextStyle(
                      fontSize: widget.isMobile ? 16 : 18,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: Navigate to courses
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary, //CustomHexColors.fromHex('#2a3935'),
                        foregroundColor: Colors.black
                      ),
                      child: const Text('Browse Courses'),
                    ),
                  ),
                ],
              ),
            );
  }
}