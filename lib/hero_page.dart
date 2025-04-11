import 'package:flutter/material.dart';

class HeroPage extends StatefulWidget {
  final bool isMobile;
  const HeroPage({super.key, required this.isMobile});

  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: 40),
        Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(widget.isMobile ? 16 : 20),
                  decoration: BoxDecoration(
                    // color: CustomHexColors.fromHex('#2a3935')
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
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Build ',
                          style: TextStyle(
                                  color: Colors.white,
                                  fontSize: widget.isMobile ? 24 : 40,
                                  fontWeight: FontWeight.bold),
                            
                          children: [
                            TextSpan(
                              text: 'Wealth',
                              style: TextStyle(
                                  color: Colors.amber,
                                ),
                              // You can add a gesture recognizer to handle taps on the Privacy Policy
                              // recognizer: TapGestureRecognizer()
                              //   ..onTap = () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => Login()),
                                  // );
                              //   },
                            ),
                            TextSpan(
                              text: ' & ',
                            ),
                            TextSpan(
                              text: 'Time Freedom',
                              style: TextStyle(
                                  color: Colors.amber,
                                ),
                            ),
                            TextSpan(
                              text: ' By Tapping\nInto The Digital Economy ',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        textAlign: TextAlign.center,
                        softWrap: true,
                        'Earn from  asimple system that works 24/7 without creating any products or spending years learning complicated skills',
                        style: TextStyle(
                          fontSize: widget.isMobile ? 16 : 18,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 25),
                      Text('Experience timeless learning and earning',
                              style: TextStyle(
                                  color: Colors.amber.withOpacity(0.9),
                                  fontStyle: FontStyle.italic
                                ),
                                )
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding:widget.isMobile? const EdgeInsets.all(20.0):EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Container(
                      width:widget.isMobile?400: 800,
                      height: widget.isMobile?250:450,
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.1),
                        // borderRadius:
                        //     const BorderRadius.vertical(
                        //   top: Radius.circular(4),
                        // ),
                        borderRadius:
                         BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: Icon(
                            Icons.play_circle_outline,
                            size: 40),
                      ),
                    ),
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
                            backgroundColor: Colors.amber, //Theme.of(context).colorScheme.primary, //CustomHexColors.fromHex('#2a3935'),
                            foregroundColor: Colors.black,
                            side: BorderSide(),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)
                            )
                          ),
                          child: const Text('JOIN THE WEALTH SYSTEM NOW',
                          style: TextStyle(
                            fontWeight: FontWeight.w500
                          ),),
                        ),
                      ),
      ],
    );
  }
}