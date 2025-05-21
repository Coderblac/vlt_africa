import 'package:flutter/material.dart';
import 'package:vlt_africa/header_text.dart';
import 'package:vlt_africa/helper.dart';

class HowVltWorks extends StatelessWidget {
  final bool isMobile;
  const HowVltWorks({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(bottom: 20, top: 40),
                        child: HeaderText(
                          headerText: 'How VLT Africa Works',
                          headerTextColor: Colors.black,
                          isMobile: isMobile),
                        ),
                        
                        !isMobile?
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            _buildHowItWorksCard(title: 'Join VLT Africa', subTitle: 'Get instant access to proven digital wealth system that gives you access to earnwhile you learn'),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 40.0),
                              child: _buildHowItWorksCard(title: 'Leverage our tools', subTitle: 'usr our system training and mentorship to start earning fast, even if you\'re a total beginner'),
                            ),
                            _buildHowItWorksCard(title: 'Earn and Scale', subTitle: 'Every time you help someone tap into the system you get paid over and over again')
                          ],
                        )
                        :Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildHowItWorksCard(title: 'Join VLT Africa', subTitle: 'Get instant access to proven digital wealth system that gives you access to earnwhile you learn'),
                            _buildHowItWorksCard(title: 'Leverage our tools', subTitle: 'usr our system training and mentorship to start earning fast, even if you\'re a total beginner'),
                            _buildHowItWorksCard(title: 'Earn and Scale', subTitle: 'Every time you help someone tap into the system you get paid over and over again')
                          ],
                        ),
                        SizedBox(height: 40),
                      ],
                    )
    );
  }

  Widget _buildHowItWorksCard({required String title, required String subTitle}){
    return Card(
      elevation: 5,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                              ),
                              child: SizedBox(
                                width: 200,
                                height: 230,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 30.0, left: 20, right: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: CustomHexColors.fromHex('#2a3935').withOpacity(0.6)
                                        ),
                                        child: Icon(Icons.person_outline,
                                        color: Colors.amber,),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        textAlign: TextAlign.center,
                                        title,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),),
                                      SizedBox(height: 12),
                                      Text(
                                        textAlign: TextAlign.center,
                                        subTitle,
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.8),
                                        fontWeight: FontWeight.normal,
                                      ),)
                                    ],
                                  ),
                                ),
                              ),
                            );
  }
}