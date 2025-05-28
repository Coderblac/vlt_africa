import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vlt_africa/appbar.dart';
import 'package:vlt_africa/botton.dart';
import 'package:vlt_africa/courses_page.dart';
import 'package:vlt_africa/dashboard.dart';
import 'package:vlt_africa/helper.dart';
import 'package:vlt_africa/hero_page.dart';
import 'package:vlt_africa/how_vlt_works.dart';
import 'package:vlt_africa/register_page.dart';
import 'package:vlt_africa/responsive.dart';
import 'package:vlt_africa/team.dart';
import 'package:vlt_africa/what_you_get.dart';
import 'package:vlt_africa/why_choose_vlt.dart';

class NewHomePage extends StatelessWidget {
  const NewHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Responsive.isMobile(context)
          ? _buildMobileDrawer(context: context)
          : null,
      appBar: AppBar(
        leading: Image.asset(
          'assets/logo/logo_v1.jpeg',
          height: 60,
          width: 100,
          fit: BoxFit.cover,
        ),
        centerTitle: false,
        actions: !Responsive.isMobile(context) ? [CustomAppBar()] : [],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeroPage(isMobile: Responsive.isMobile(context)),
              !Responsive.isMobile(context)
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: Responsive.isTablet(context) ? 2 : 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: WhyChooseVlt(),
                              ),
                              Team(),                             ],
                          ),
                        ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: HowVltWorks(),
                                ),
                                
                              ],
                            ),
                          ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Team(),
                        SizedBox(height: 20),
                        WhyChooseVlt(),
                        HowVltWorks(),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileDrawer({required BuildContext context}) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(height: 20),
          Text(
            textAlign: TextAlign.center,
            'VLT AFRICA',
            style: TextStyle(
              color: CustomHexColors.fromHex('#d3efe9'),
              fontSize: 24,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Courses'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CoursesPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.bookmark),
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Dashboard()));
            },
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
            child: HelperButton(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                title: 'Get Started',
                btnColor: Colors.amber,
                titleColor: Colors.black),
          ),
        ],
      ),
    );
  }
}
