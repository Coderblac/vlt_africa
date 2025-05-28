import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vlt_africa/botton.dart';
import 'package:vlt_africa/helper.dart';
import 'package:vlt_africa/responsive.dart';

class WhatYouGet extends StatelessWidget {
  const WhatYouGet({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              elevation: 10,
              child: Container(
                // height: 400,
                width: 500,
                decoration: BoxDecoration(
                  color: CustomHexColors.fromHex('#2a3935'),
                      // gradient: LinearGradient(
                      //   begin: Alignment.bottomRight,
                      //   end: Alignment.topLeft,
                      //   colors: [
                      //     CustomHexColors.fromHex('#2a3935'),
                      //     Theme.of(context).colorScheme.primary
                      //   ],
                      // ),
                      borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Text('What You Get Instantly',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: Responsive.isMobile(context) ? 16 : 20,
                      ),),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10),
                        )
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 15),
                          _buildWhatYouGet(title: 'Access to our Smart Path Earning System', context: context),
                          _buildWhatYouGet(title: 'Access to our Daily Courses', context: context,),
                          _buildWhatYouGet(title: 'Access to our Direct Mentorship', context: context,),
                          // _buildWhatYouGet(title: 'Access to our Smart Path Earning System', context: context,),
                          // _buildWhatYouGet(title: 'Access to our Smart Path Earning System', context: context,),
                    
                          SizedBox(height: 25),
                          HelperButton(onTap: (){},
                          title: 'JOIN THE WEALTH SYSTEM NOW  >>',
                          btnColor: Colors.amber,
                          titleColor: Colors.black),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                    ],
                ),
              ),
            );
  }
    Widget _buildWhatYouGet({required String title, required BuildContext context,}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(CupertinoIcons.check_mark,
          color: Colors.amber),
          SizedBox(width: 10),
          SizedBox(
            width: Responsive.isMobile(context)? 200:250,
            child: Text(
              softWrap: true,
              title,
            style: TextStyle(
              fontSize: Responsive.isMobile(context)? 12 : 16,
              color: Colors.black
            ),),
          )
        ],
      ),
    );
  }
}