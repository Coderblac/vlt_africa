import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vlt_africa/courses_page.dart';
import 'package:vlt_africa/helper.dart';
import 'package:vlt_africa/responsive.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    super.key
  });

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final ScrollController _scrollController = ScrollController();

  double _startDragY = 0.0;

  void _startDrag(DragStartDetails details) {
    _startDragY = details.globalPosition.dy;
  }

  void _updateScroll(DragUpdateDetails details) {
    final delta = details.globalPosition.dy - _startDragY;
    _scrollController.jumpTo(_scrollController.offset - delta);
    _startDragY = details.globalPosition.dy; // Update the start position
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Don't forget to dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        title: Text('DASHBOARD',
        style: TextStyle(
          fontSize: Responsive.isMobile(context)
          ? 16 : 18
        ),),
        leading: Image.asset(
          'assets/logo/logo_v1.jpeg',
          width: 100,
          fit: BoxFit.cover,
        ),
      ),
      body: GestureDetector(
        onPanStart: (details) {
              // Start dragging
              _startDrag(details);
            },
            onPanUpdate: (details) {
              // Update scroll position based on drag
              _updateScroll(details);
            },
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              _buildMembersFeedBack(),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:Responsive.isMobile(context)? 16: 40.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 220,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: CustomHexColors.fromHex(
                              '#19715c'), //Theme.of(context).colorScheme.primary, //CustomHexColors.fromHex('#2a3935'),
                          foregroundColor: Theme.of(context).colorScheme.secondary,
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      child: Row(
                        children: [
                          Text(
                            'View Earnings & Team',
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.link)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: Responsive.isDesktop(context)? 2 : 3,
                    child: SizedBox(
                height: Responsive.isMobile(context) ? 1000 : 1000,
                child: Container(
                  color: Colors.white.withOpacity(0.5),

                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: 
                        
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.school,
                                        size: 35,
                                        color: CustomHexColors.fromHex('#19715c'),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Learning',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    'Build your essential skills',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: CustomHexColors.fromHex(
                                        '#19715c'), //Theme.of(context).colorScheme.primary, //CustomHexColors.fromHex('#2a3935'),
                                    foregroundColor: Colors.black,
                                    side: BorderSide.none,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5))),
                                child: Text(
                                  'View All',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // _buildFreeLearning(isMobile: Responsive.isMobile(context)),
                        
                        CoursesPage()
                      ],
                    ),
                  ),
                ),
              ),),

              if(!Responsive.isMobile(context)&&!Responsive.isTablet(context))
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                                        
               _buildUpdates(),
               _buildHelpAndSupport(),
                        ],
                      ))
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }


  Widget _buildMembersFeedBack() {
    return Container(
      color: CustomHexColors.fromHex('#19715c'),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: Responsive.isMobile(context)? 10: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade200,
                    ),
                    child: Icon(
                      Icons.badge,
                      color: CustomHexColors.fromHex('#19715c'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Membership ID',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'VLT-0736',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              'Use This ID when Contacting support',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpdates(){
    return  SizedBox(
            // height: Responsive.isMobile(context) ? 280 : 450,
            child: Card(
              color: Colors.white,
              margin: Responsive.isMobile(context) ? EdgeInsets.all(20) : EdgeInsets.symmetric(horizontal: 40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.update,
                                    size: 35,
                                    color: CustomHexColors.fromHex('#19715c'),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Updates',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Text(
                                'Latest news and announcement',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    TextButton(onPressed: (){},
                    child: Text(
                              'View All Updates',
                              style: TextStyle(
                                  color:CustomHexColors.fromHex('#19715c'),
                                  fontWeight: FontWeight.w500),
                            ),)
                  ],
                ),
              ),
            ),
          );
  }

    Widget _buildHelpAndSupport(){
    return  SizedBox(
            // height: Responsive.isMobile(context) ? 280 : 450,
            child: Card(
              color: Colors.white,
              margin: Responsive.isMobile(context) ? EdgeInsets.all(20) : EdgeInsets.all(40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.help_center,
                                    size: 35,
                                    color: CustomHexColors.fromHex('#19715c'),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Help & Support',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Text(
                                'Get assistance when you need it',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: CustomHexColors.fromHex(
                              '#19715c'), //Theme.of(context).colorScheme.primary, //CustomHexColors.fromHex('#19715c'),
                          foregroundColor: Theme.of(context).colorScheme.secondary,
                          // side: BorderSide(),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      child: Row(
                        children: [                       
                          Icon(Icons.question_answer),
                          SizedBox(width: 10),
                          Text(
                            'Frequently Asked Questions',
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.w500),
                          ),                      
                        ],
                      ),
                                        ),
                    ),
                    SizedBox(height: 10),
                  SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: CustomHexColors.fromHex(
                              '#19715c'), //Theme.of(context).colorScheme.primary, //CustomHexColors.fromHex('#2a3935'),
                          foregroundColor: Theme.of(context).colorScheme.secondary,
                          // side: BorderSide(),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      child: Row(
                        children: [                       
                          Icon(Icons.support_agent),
                          SizedBox(width: 10),
                          Text(
                            'Contact Support',
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.w500),
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
