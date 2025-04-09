import 'package:flutter/material.dart';
import 'package:vlt_africa/category_card.dart';
import 'package:vlt_africa/model.dart';

class ResponsiveGrid extends StatefulWidget {
  final bool isMobile;
  const ResponsiveGrid({super.key, required this.isMobile});

  @override
  State<ResponsiveGrid> createState() => _ResponsiveGridState();
}

class _ResponsiveGridState extends State<ResponsiveGrid> {
  final List<CategoryModel> category = [
    CategoryModel(
      title: 'Programming',
    ), //icon: Icons.code
    CategoryModel(
      title: 'Design',
    ), //icon: Icons.design_services
    CategoryModel(
      title: 'Business',
    ), //icon: Icons.business
    CategoryModel(
      title: 'Marketing',
    ), //icon: Icons.bar_chart
    CategoryModel(
      title: 'Programming',
    ), //icon: Icons.code
    CategoryModel(
      title: 'Design',
    ), //icon: Icons.design_services
    CategoryModel(
      title: 'Business',
    ), //icon: Icons.business
    CategoryModel(
      title: 'Marketing',
    ), //icon: Icons.bar_chart
  ];

  ScrollController _scrollController = ScrollController();

  double _startDragX = 0.0;

  void _startDrag(DragStartDetails details) {
    _startDragX = details.globalPosition.dx; // Capture the initial X position
  }

  void _updateScroll(DragUpdateDetails details) {
    final delta =
        details.globalPosition.dx - _startDragX; // Calculate the change in X
    _scrollController
        .jumpTo(_scrollController.offset - delta); // Update the scroll position
    _startDragX = details.globalPosition.dx; // Update the start position
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Don't forget to dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(widget.isMobile ? 16 : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Categories',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          widget.isMobile
              ? SizedBox(
                  height: 30, // Adjust height as needed
                  width: MediaQuery.of(context).size.width,
                  child: GestureDetector(
                    onPanStart: (details) {
                      _startDrag(details);
                    },
                    onPanUpdate: (details) {
                      _updateScroll(details);
                    },
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      controller: _scrollController,
                      // physics: NeverScrollableScrollPhysics(),
                      itemCount: category.length,
                      itemBuilder: (context, index) {
                        final cat = category[index]; // Get the product
                        return CategoryCard(
                          title: cat.title,
                          isMobile: widget.isMobile,
                        ); //icon: cat.icon,
                      },
                    ),
                  ),

                  // Expanded(
                  //   child: GridView.builder(
                  //     shrinkWrap: true,
                  //     physics: NeverScrollableScrollPhysics(),
                  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //       crossAxisCount: 3,
                  //       childAspectRatio: 1,
                  //       crossAxisSpacing: 4,
                  //       mainAxisSpacing: 16,
                  //     ),
                  //     itemCount: 3,
                  //     //category
                  //         //.length,
                  //     itemBuilder: (context, index) {
                  //       final cat = category[index]; // Get the product
                  //       return CategoryCard(title:cat.title,  isMobile: widget.isMobile,);//icon: cat.icon,
                  //     },
                  //   ),
                  // ),
                )
              : SizedBox(
                  height: 38, //200
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    controller: _scrollController,
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: category.length,
                    itemBuilder: (context, index) {
                      final cat = category[index]; // Get the product
                      return CategoryCard(
                        title: cat.title,
                        isMobile: widget.isMobile,
                      ); //icon: cat.icon,
                    },
                  ),
                ),
          SizedBox(height: 20),
          // Featured Courses Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Featured E-book Courses',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              // SizedBox(
              //   height: isMobile ? 250 : 300,
              //   child: ListView(
              //     scrollDirection: Axis.horizontal,
              //     children: [
              //       CorporateCover(isDarkMode: isDarkMode),
              //       const SizedBox(width: 20),
              //       CorporateCover(isDarkMode: isDarkMode),
              //       const SizedBox(width: 20),
              //       CorporateCover(isDarkMode: isDarkMode),
              //     ],
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
