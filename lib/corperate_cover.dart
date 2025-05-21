import 'package:flutter/material.dart';
import 'package:vlt_africa/helper.dart';
import 'package:vlt_africa/learn_page.dart';
import 'package:vlt_africa/model.dart';

class CorporateCover extends StatelessWidget {
  final bool isMobile;
  // final int id;
  final String bookTitle;
  final String subtitle;
  final String imageUrl;
  final CategoryModel category;
  const CorporateCover({
    super.key,
    // required this.id,
    required this.bookTitle,
    required this.subtitle,
    required this.imageUrl,
    required this.category,
    required this.isMobile,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)
        =>LearningPage()));
      },
      child: SizedBox(
        child: Container(
          width: 80,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
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
              // Positioned(
              //   left: 0,
              //   right: 0,
              //   top: 0,
              //   bottom: 0,
              //   child: ClipPath(
              //     clipper: CustomClipPath(),
              //     child: Container(
              //       height: isMobile ? 100 : 150,
              //       width: isMobile ? 75 : 100,
              //       color: CustomHexColors.fromHex('#2a3935'),
              //       child: Align(
              //         alignment: Alignment.topCenter,
              //         // child:
              //       ),
              //     ),
              //   ),
              // ),
             
              Positioned(
                top: 0,
                left: 10,
                right: 10,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      bookTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isMobile ? 12 : 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        subtitle, //Lorem ipsum dolor sit amet
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isMobile ? 10 : 10,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(16),
                    //   child: Image.asset(
                    //     //network
                    //     imageUrl,
                    //     width: isMobile ?130:130,
                    //     height: isMobile ? 100:100,
                    //     fit: BoxFit.cover,
                    //     color: Theme.of(context)
                    //         .colorScheme
                    //         .inversePrimary
                    //         .withOpacity(0.7),
                    //     colorBlendMode: BlendMode.darken,
                    //   ),
                    // ),
                  ],
                ),
              ),
      
               // Text overlay "2030"
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: CustomHexColors.fromHex('#2a3935'),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'READ NOW',
                        style: TextStyle(
                          fontSize: isMobile ? 10 : 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
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
    path.lineTo(size.width, size.height * 0.0);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
