import 'package:flutter/material.dart';
import 'package:vlt_africa/comments.dart';
import 'package:vlt_africa/helper.dart';
import 'package:vlt_africa/responsive.dart';
import 'model.dart';
import 'paystack_payment_page.dart';
import 'services/payment_service.dart';

class CourseDetailsPage extends StatefulWidget {
  final VideoCourseModel course;


  const CourseDetailsPage({
    super.key,
    required this.course,
  });

  @override
  State<CourseDetailsPage> createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage> {
  bool _isSubscribed = false;

  @override
  void initState() {
    super.initState();
    _checkSubscriptionStatus();
  }

  Future<void> _checkSubscriptionStatus() async {
    final status = await PaymentService.getPaymentStatus();
    setState(() {
      _isSubscribed = status;
    });
  }

  Future<void> _handlePayment() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaystackPaymentPage(
          courseTitle: widget.course.title,
        ),
      ),
    );

    if (result == true) {
      setState(() {
        _isSubscribed = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.course.title,
          style: TextStyle(
            fontSize: Responsive.isMobile(context) ? 14 : 20,
          ),
        ),
        backgroundColor: CustomHexColors.fromHex('#19715c'),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Video Player Section
            Center(
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: Responsive.isMobile(context)
                          ? MediaQuery.of(context).size.height * 0.25
                          : 450,
                      width:
                          Responsive.isMobile(context) ? double.infinity : 800,
                      color: Colors.black,
                      child: _isSubscribed
                          ? Stack(
                              children: [
                                const Center(
                                  child: Icon(
                                    Icons.play_circle_outline,
                                    color: Colors.white,
                                    size: 60,
                                  ),
                                ),
                              ],
                            )
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // const Icon(
                                  //   Icons.lock,
                                  //   color: Colors.white,
                                  //   size: 40,
                                  // ),
                                  const SizedBox(height: 16),
                                  ElevatedButton(
                                    onPressed: _handlePayment,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          CustomHexColors.fromHex('#19715c'),
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 24,
                                        vertical: 12,
                                      ),
                                    ),
                                    child: const Text('Subscribe to Access'),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),

            // Course Info Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.course.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.course.subtitle,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.access_time, color: Colors.grey[600]),
                      const SizedBox(width: 8),
                      Text(
                        widget.course.totalDuration,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(width: 24),
                      Icon(Icons.menu_book, color: Colors.grey[600]),
                      const SizedBox(width: 8),
                      Text(
                        '${widget.course.totalChapters} chapters',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.all(16.0),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context) =>
                    CommentsSection(course: widget.course)));
                  }, child: Text('View Comments')),
                ],
              ),
            ),

            // Chapters List Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Course Content',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.course.chapters.length,
              itemBuilder: (context, index) {
                final chapter = widget.course.chapters[index];
                return ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2a3935),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    chapter.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(chapter.duration),
                  trailing: _isSubscribed
                      ? Icon(
                          chapter.isCompleted
                              ? Icons.check_circle
                              : Icons.play_circle_outline,
                          color:
                              chapter.isCompleted ? Colors.green : Colors.grey,
                        )
                      : const Icon(
                          Icons.lock,
                          color: Colors.grey,
                        ),
                  onTap: _isSubscribed
                      ? () {
                          // TODO: Implement video playback
                        }
                      : _handlePayment,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
