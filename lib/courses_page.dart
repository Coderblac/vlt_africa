import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vlt_africa/courses_list.dart';
import 'package:vlt_africa/helper.dart';
import 'package:vlt_africa/model.dart';

class CoursesPage extends StatefulWidget {
  final List<CategoryModel> categories;
  final bool isMobile;
  const CoursesPage({super.key, required this.categories, required this.isMobile});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final ScrollController _scrollController = ScrollController();
  
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Courses Category
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(16),
            color: CustomHexColors.fromHex('#2a3935'),
            child: Text(
              textAlign: TextAlign.center,
              'Courses',
              style: TextStyle(color: Colors.white,
              fontSize: 18),),
          ),
          SizedBox(
            height: 85,
            child: Scrollbar(
              thickness: 8,
              controller: _scrollController,
              thumbVisibility: true,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16, top: 16),
                child: ListView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.categories.length,
                  itemBuilder: (context, index){
                    final category = widget.categories[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                        ),
                        onPressed: (){},
                        child: Text(category.title)),
                    );
                  }
                  ),
              ),
            ),
          ),
          CoursesList(isMobile: widget.isMobile)
        ],
      ),
    );
  }
}