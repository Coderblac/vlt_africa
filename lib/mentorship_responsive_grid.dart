import 'package:flutter/material.dart';
import 'package:vlt_africa/model.dart';

class MentorshipResponsiveGrid extends StatefulWidget {
  final bool isMobile;
  final String title;
  const MentorshipResponsiveGrid({super.key, required this.isMobile, required this.title});

  @override
  State<MentorshipResponsiveGrid> createState() => _MentorshipResponsiveGridState();
}

class _MentorshipResponsiveGridState extends State<MentorshipResponsiveGrid> {

      final List<CategoryModel> category =[
    CategoryModel(title: 'Programming', ),//icon: Icons.code
    CategoryModel(title: 'Design', ),//icon: Icons.design_services
    CategoryModel(title: 'Business', ),//icon: Icons.business
    CategoryModel(title: 'Marketing', ),//icon: Icons.bar_chart
        CategoryModel(title: 'Programming',), //icon: Icons.code
    CategoryModel(title: 'Design',), //icon: Icons.design_services
    CategoryModel(title: 'Business',), //icon: Icons.business
    CategoryModel(title: 'Marketing',), //icon: Icons.bar_chart

  ];


  @override
  Widget build(BuildContext context) {
    return  Padding(
                    padding: EdgeInsets.all(widget.isMobile ? 16 : 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widget.isMobile
                            ? ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return Card(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    child: ListTile(
                                      leading:
                                          const Icon(Icons.play_circle_outline),
                                      title: Text('Course ${index + 1}'),
                                      subtitle:
                                         Text(widget.title),//'Beginner to Advanced'
                                      trailing:
                                          const Icon(Icons.arrow_forward_ios),
                                      onTap: () {
                                        // TODO: Navigate to course details
                                      },
                                    ),
                                  );
                                },
                              )
                            : GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                  childAspectRatio: 1.5,
                                ),
                                itemCount: 6,
                                itemBuilder: (context, index) {
                                  return Card(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary
                                                  .withOpacity(0.1),
                                              borderRadius:
                                                  const BorderRadius.vertical(
                                                top: Radius.circular(4),
                                              ),
                                            ),
                                            child: const Center(
                                              child: Icon(
                                                  Icons.play_circle_outline,
                                                  size: 40),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Course ${index + 1}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                               Text(
                                                  widget.title),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                      ],
                    ),
                  );
  }
}