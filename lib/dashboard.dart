import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vlt_africa/helper.dart';

class Dashboard extends StatefulWidget {
  final bool isMobile;
  const Dashboard({
    super.key,
    required this.isMobile,
  });

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  ScrollController _scrollController = ScrollController();

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
        title: const Text('VLT MEMBERSHIP DASHBOARD'),
        leading: SizedBox.shrink(),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 220,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: CustomHexColors.fromHex(
                              '#2a3935'), //Theme.of(context).colorScheme.primary, //CustomHexColors.fromHex('#2a3935'),
                          foregroundColor: Theme.of(context).colorScheme.secondary,
                          side: BorderSide(),
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
              SizedBox(
                height: widget.isMobile ? 280 : 450,
                child: Card(
                  color: Colors.white,
                  margin: widget.isMobile ? EdgeInsets.all(20) : EdgeInsets.all(40),
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
                                        Icons.school,
                                        size: 35,
                                        color: CustomHexColors.fromHex('#2a3935'),
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
                                        '#2a3935'), //Theme.of(context).colorScheme.primary, //CustomHexColors.fromHex('#2a3935'),
                                    foregroundColor: Colors.black,
                                    side: BorderSide(),
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
                        _buildFreeLearning(isMobile: widget.isMobile),
                      ],
                    ),
                  ),
                ),
              ),
               _buildUpdates(),
               _buildHelpAndSupport(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFreeLearning({required bool isMobile}) {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: isMobile ? 1 * 0.1 : 1 * 0.1,
        ),
        itemCount: 3,
        itemBuilder: (context, index) {
          return _buildLearningVideoCard(isMobile: widget.isMobile);
        },
      ),
    );
  }

  Widget _buildLearningVideoCard({required bool isMobile}) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            height: widget.isMobile ? 80 : 200,
            width: 350,
            color: Colors.black,
            child: Icon(Icons.play_circle),
          ),
        ),
        SizedBox(
          height: widget.isMobile ? 40 : 200,
          width: 350,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textAlign: TextAlign.left,
                'Course',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: isMobile ? 12 : 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                textAlign: TextAlign.left,
                '1h 10 min',
                style: TextStyle(
                  fontSize: isMobile ? 10 : 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMembersFeedBack() {
    return Card(
      color: CustomHexColors.fromHex('#2a3935'),
      margin: widget.isMobile ? EdgeInsets.all(20) : EdgeInsets.all(40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40),
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
                      color: CustomHexColors.fromHex('#2a3935'),
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
            // height: widget.isMobile ? 280 : 450,
            child: Card(
              color: Colors.white,
              margin: widget.isMobile ? EdgeInsets.all(20) : EdgeInsets.all(40),
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
                                    color: CustomHexColors.fromHex('#2a3935'),
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
                                  color:CustomHexColors.fromHex('#2a3935'),
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
            // height: widget.isMobile ? 280 : 450,
            child: Card(
              color: Colors.white,
              margin: widget.isMobile ? EdgeInsets.all(20) : EdgeInsets.all(40),
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
                                    color: CustomHexColors.fromHex('#2a3935'),
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
                              '#2a3935'), //Theme.of(context).colorScheme.primary, //CustomHexColors.fromHex('#2a3935'),
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
                              '#2a3935'), //Theme.of(context).colorScheme.primary, //CustomHexColors.fromHex('#2a3935'),
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
