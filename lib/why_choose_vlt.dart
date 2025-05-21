import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vlt_africa/botton.dart';
import 'package:vlt_africa/header_text.dart';
import 'package:vlt_africa/helper.dart';

class WhyChooseVlt extends StatelessWidget {
  final bool isMobile;
  const WhyChooseVlt({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.grey.shade50,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 40),
              child: HeaderText(
                  headerText: 'Why Choose VLT Africa',
                  headerTextColor: Colors.black,
                  isMobile: isMobile),
            ),
            !isMobile
                ? Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      _buildWhyChooseVltCard(
                          subTitle: 'Work from anywhere, anytime',
                          context: context, isMobile: isMobile),
                      _buildWhyChooseVltCard(
                          subTitle: 'Earn while you sleep', context: context, isMobile: isMobile),
                      _buildWhyChooseVltCard(
                          subTitle: 'Fully beginner friendly',
                          context: context, isMobile: isMobile),
                      _buildWhyChooseVltCard(
                          subTitle: 'Done for your marketing tools',
                          context: context, isMobile: isMobile),
                      _buildWhyChooseVltCard(
                          subTitle:
                              'world-class mentorship from top digital entreneurs',
                          context: context, isMobile: isMobile),
                      _buildWhyChooseVltCard(
                          subTitle:
                              'NGN 300,000 worth of personalized business dashboard - FREE',
                          context: context, isMobile: isMobile),
                      _buildWhyChooseVltCard(
                          subTitle:
                              'Earn internalional trips, bonuses & legacy transfer options',
                          context: context, isMobile: isMobile)
                    ],
                  )
                : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildWhyChooseVltCard(
                            subTitle: 'Work from anywhere, anytime',
                            context: context, isMobile: isMobile),
                        _buildWhyChooseVltCard(
                            subTitle: 'Earn while you sleep', context: context, isMobile: isMobile),
                        _buildWhyChooseVltCard(
                            subTitle: 'Fully beginner friendly', context: context, isMobile: isMobile),
                        _buildWhyChooseVltCard(
                          subTitle: 'Done for your marketing tools',
                          context: context, isMobile: isMobile),
                      _buildWhyChooseVltCard(
                          subTitle:
                              'world-class mentorship from top digital entreneurs',
                          context: context, isMobile: isMobile),
                      _buildWhyChooseVltCard(
                          subTitle:
                              'NGN 300,000 worth of personalized business dashboard - FREE',
                          context: context, isMobile: isMobile),
                      _buildWhyChooseVltCard(
                          subTitle:
                              'Earn internalional trips, bonuses & legacy transfer options',
                          context: context, isMobile: isMobile)
                      ],
                    ),
                ),
                SizedBox(height: 40),
                Container(
                  margin: isMobile? EdgeInsets.symmetric(horizontal: 20):EdgeInsets.symmetric(horizontal: 0),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 2, 22, 39),
                  ),
                  child: Text('Your income doesn\'t die with you.Our platform allows future earning to be passed to your children.'),
                ),
            SizedBox(height: 40),

            Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              elevation: 10,
              child: Container(
                height: 400,
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
                        fontSize: 20
                      ),),
                    ),
                    Expanded(
                      child: Container(
                        width: 700,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10),
                          )
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 15),
                            _buildWhatYouGet(title: 'Access to our Smart Path Earning System'),
                            _buildWhatYouGet(title: 'Access to our Smart Path Earning System'),
                            _buildWhatYouGet(title: 'Access to our Smart Path Earning System'),
                            _buildWhatYouGet(title: 'Access to our Smart Path Earning System'),
                            _buildWhatYouGet(title: 'Access to our Smart Path Earning System'),

                            SizedBox(height: 25),
                            HelperButton(onTap: (){},
                            title: 'JOIN THE WEALTH SYSTEM NOW  >>',
                            btnColor: Colors.amber,
                            titleColor: Colors.black)
                          ],
                        ),
                      ),
                    )
                    ],
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ));
  }

  Widget _buildWhyChooseVltCard(
      {required String subTitle, required BuildContext context, required bool isMobile}) {
    return SizedBox(
      child: Card(
        elevation: 2,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: SizedBox(
          width: 500,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.verified_outlined,
                    color: Theme.of(context).colorScheme.primary),
                    SizedBox(width: 20),
                SizedBox(
                  width: isMobile? MediaQuery.of(context).size.width *0.7:400,
                  child: Text(
                    textAlign: TextAlign.left,
                    softWrap: true,
                    subTitle,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWhatYouGet({required String title}){
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40,top: 10,bottom: 10, right: 10),
          child: Icon(CupertinoIcons.check_mark,
          color: Colors.amber),
        ),
        Text(title,
        style: TextStyle(
          color: Colors.black
        ),)
      ],
    );
  }
}
