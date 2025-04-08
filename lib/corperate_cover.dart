import 'package:flutter/material.dart';

class CorporateCover extends StatelessWidget {
  final bool isDarkMode;

  const CorporateCover({super.key, required this.isDarkMode});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300, // Adjust size according to your needs
          height: 450,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(4, 4),
                blurRadius: 8,
              ),
            ],
          ),
          child: Stack(
            children: [
              // Background with blue overlay and shapes
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    height: 250,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Text(
                            'CORPORATE',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'okay ooo',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Lorem ipsum dolor sit amet',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Image in the center with blue overlay
              Positioned(
                left: 50,
                top: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    'data:image/jpeg;base64,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', // Replace with your own image asset
                    width: 200,
                    height: 250,
                    fit: BoxFit.cover,
                    color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.7),
                    colorBlendMode: BlendMode.darken,
                  ),
                ),
              ),
              // Text overlay "2030"
              Positioned(
                bottom: 20,
                left: 10,
                child: Container(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\$20',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'LOREM',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Clipper for creating a diagonal shape
class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height * 0.5);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

