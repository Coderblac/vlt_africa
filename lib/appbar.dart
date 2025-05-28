import 'package:flutter/material.dart';
import 'package:vlt_africa/botton.dart';
import 'package:vlt_africa/dashboard.dart';
import 'package:vlt_africa/helper.dart';
import 'package:vlt_africa/register_page.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(
        MediaQuery.of(context).size.width,
        100, // Adjust height as needed
        ), child: 
            Row(
              children: [
                TextButton(
                  child: Text('About', style: TextStyle(color: Colors.black)),
                  onPressed: () {
                    // Navigate to home
                  },
                ),
                TextButton(
                  child: Text('Courses', style: TextStyle(color: Colors.black)),
                  onPressed: () {
                    // Navigate to courses
                  },
                ),
                TextButton(
                  child: Text('Dashboard', style: TextStyle(color: Colors.black)),
                  onPressed: () {
                    // Navigate to dashboard
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()),
                    );
                  },
                ),
                SizedBox(width: 10),
                HelperButton(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      RegisterPage()));
                        },
                        title: 'Get Started',
                        btnColor: CustomHexColors.fromHex('#19715c'),
                        titleColor: CustomHexColors.fromHex('#ffffff')),
                  SizedBox(width: 10), //#19715c
              ],
            )
    );
  }
}