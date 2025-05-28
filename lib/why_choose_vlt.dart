import 'package:flutter/material.dart';
import 'package:vlt_africa/header_text.dart';
import 'package:vlt_africa/helper.dart';
import 'package:vlt_africa/responsive.dart';


class WhyChooseVlt extends StatelessWidget {
  const WhyChooseVlt({super.key,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 40),
              child: HeaderText(
                  headerText: 'Why Choose VLT Africa',
                  headerTextColor: Colors.black,
                  ),//isMobile: isMobile
            ),
            !Responsive.isMobile(context)
                ? Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      _buildWhyChooseVltCard(
                          subTitle: 'Work from anywhere, anytime',
                          context: context,),
                      _buildWhyChooseVltCard(
                          subTitle: 'Earn while you sleep', context: context,),
                      _buildWhyChooseVltCard(
                          subTitle: 'Fully beginner friendly',
                          context: context,),
                      _buildWhyChooseVltCard(
                          subTitle: 'Done for your marketing tools',
                          context: context,),
                      _buildWhyChooseVltCard(
                          subTitle:
                              'world-class mentorship from top digital entreneurs',
                          context: context,),
                      _buildWhyChooseVltCard(
                          subTitle:
                              'NGN 300,000 worth of personalized business dashboard - FREE',
                          context: context,),
                      _buildWhyChooseVltCard(
                          subTitle:
                              'Earn internalional trips, bonuses & legacy transfer options',
                          context: context,)
                    ],
                  )
                : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildWhyChooseVltCard(
                            subTitle: 'Work from anywhere, anytime',
                            context: context,),
                        _buildWhyChooseVltCard(
                            subTitle: 'Earn while you sleep', context: context,),
                        _buildWhyChooseVltCard(
                            subTitle: 'Fully beginner friendly', context: context,),
                        _buildWhyChooseVltCard(
                          subTitle: 'Done for your marketing tools',
                          context: context,),
                      _buildWhyChooseVltCard(
                          subTitle:
                              'world-class mentorship from top digital entreneurs',
                          context: context,),
                      _buildWhyChooseVltCard(
                          subTitle:
                              'NGN 300,000 worth of personalized business dashboard - FREE',
                          context: context,),
                      _buildWhyChooseVltCard(
                          subTitle:
                              'Earn internalional trips, bonuses & legacy transfer options',
                          context: context,)
                      ],
                    ),
                ),
                SizedBox(height: 40),
                Container(
                  margin: Responsive.isMobile(context)? EdgeInsets.symmetric(horizontal: 20):EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 2, 22, 39),
                  ),
                  child: Text('Your income doesn\'t die with you.Our platform allows future earning to be passed to your children.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Responsive.isMobile(context)? 12 : 16,
                    fontWeight: FontWeight.w500
                  ),),
                ),

          ],
        ));
  }

  Widget _buildWhyChooseVltCard(
      {required String subTitle, required BuildContext context,}) {
    return SizedBox(
      child: Card(
        elevation: 2,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: SizedBox(
          // width: 500,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.verified_outlined,
                    color: CustomHexColors.fromHex('#19715c'),
                ),
                    SizedBox(width: 20),
                SizedBox(
                  width: Responsive.isMobile(context)? MediaQuery.of(context).size.width *0.7:400,
                  child: Text(
                    textAlign: TextAlign.left,
                    softWrap: true,
                    subTitle,
                    style: TextStyle(
                      fontSize: Responsive.isMobile(context)? 12 : 16,
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
}
