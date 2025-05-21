import 'package:flutter/material.dart';
import 'package:vlt_africa/category_card.dart';
import 'package:vlt_africa/corperate_cover.dart';
import 'package:vlt_africa/mentorship_responsive_grid.dart';
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

  List<EbookModel> ebook = [
    EbookModel(
      // id: 1,
      title: 'E-Book Title',
      subtitle: 'E-Book Subtitle',
      imageUrl: 'assets/food.jpg',
      category: CategoryModel(title: 'Exotic'),
    ),
    EbookModel(
      // id: 1,
      title: 'Brief About Book',
      subtitle: 'Ashawo work sweet oo',
      imageUrl: 'assets/food.jpg',
      category: CategoryModel(title: 'Exotic'),
    ),
    EbookModel(
      // id: 1,
      title: 'E-Book Title',
      subtitle: 'E-Book Subtitle',
      imageUrl: 'assets/food.jpg',
      category: CategoryModel(title: 'Exotic'),
    ),
    EbookModel(
      // id: 1,
      title: 'Brief About Book',
      subtitle: 'Ashawo work sweet oo',
      imageUrl: 'assets/food.jpg',
      category: CategoryModel(title: 'Exotic'),
    ),
    EbookModel(
      // id: 1,
      title: 'E-Book Title',
      subtitle: 'E-Book Subtitle',
      imageUrl: 'assets/food.jpg',
      category: CategoryModel(title: 'Exotic'),
    ),
    EbookModel(
      // id: 1,
      title: 'Brief About Book',
      subtitle: 'Ashawo work sweet oo',
      imageUrl: 'assets/food.jpg',
      category: CategoryModel(title: 'Exotic'),
    ),
    EbookModel(
      // id: 1,
      title: 'E-Book Title',
      subtitle: 'E-Book Subtitle',
      imageUrl: 'assets/food.jpg',
      category: CategoryModel(title: 'Exotic'),
    ),
    EbookModel(
      // id: 1,
      title: 'Brief About Book',
      subtitle: 'Ashawo work sweet oo',
      imageUrl: 'assets/food.jpg',
      category: CategoryModel(title: 'Exotic'),
    ),
  ];

  final ScrollController _scrollController = ScrollController();
  final ScrollController _scrollController1 = ScrollController();
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

  void _startDrag1(DragStartDetails details) {
    _startDragX = details.globalPosition.dx; // Capture the initial X position
  }

  void _updateScroll1(DragUpdateDetails details) {
    final delta =
        details.globalPosition.dx - _startDragX; // Calculate the change in X
    _scrollController1.jumpTo(
        _scrollController1.offset - delta); // Update the scroll position
    _startDragX = details.globalPosition.dx; // Update the start position
  }

  @override
  void dispose() {
    _scrollController1.dispose();
    _scrollController.dispose(); // Don't forget to dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(widget.isMobile ? 16 : 20),
      child: SizedBox(
        height: widget.isMobile
        ? MediaQuery.of(context).size.height
        :null,
        width: MediaQuery.of(context).size.width,
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
                  )
                : SizedBox(
                    height: 38, //200
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
        
            widget.isMobile
                ? Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, //widget.isMobile? 3:6,
                        childAspectRatio:
                            1 / 1.2, //widget.isMobile? 1/1.2: 1/1.4,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemCount: ebook.length,
                      itemBuilder: (context, index) {
                        final ebooks = ebook[index]; // Get the product
                        return CorporateCover(
                          isMobile: widget.isMobile,
                          // id: 1,
                          bookTitle: ebooks.title,
                          subtitle: ebooks.subtitle,
                          imageUrl: ebooks.imageUrl,
                          category: ebooks.category,
                        ); //icon: cat.icon,
                      },
                    ),
                  )
                : SizedBox(
                    height: 200,
                    child: GestureDetector(
                      onPanStart: (details) {
                        _startDrag1(details);
                      },
                      onPanUpdate: (details) {
                        _updateScroll1(details);
                      },
                      child: ListView.builder(
                        controller: _scrollController1,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemCount: ebook.length,
                        itemBuilder: (context, index) {
                          final ebooks = ebook[index]; // Get the product
                          return Container(
                            width: 150,
                            margin: EdgeInsets.only(right: 10),
                            child: CorporateCover(
                              isMobile: widget.isMobile,
                              // id: 1,
                              bookTitle: ebooks.title,
                              subtitle: ebooks.subtitle,
                              imageUrl: ebooks.imageUrl,
                              category: ebooks.category,
                            ),
                          ); //icon: cat.icon,
                        },
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
