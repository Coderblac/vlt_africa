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
  
  final List<VideoCourseModel> courses = [
    VideoCourseModel(
      id: 1,
      title: "Flutter Development Bootcamp",
      subtitle: "Learn to build beautiful mobile apps with Flutter",
      imageUrl: "https://picsum.photos/400/300",
      category: "Mobile Development",
      chapters: [
        Chapter(
          id: 1,
          title: "Introduction to Flutter",
          duration: "15:30",
          videoUrl: "https://example.com/video1",
        ),
        Chapter(
          id: 2,
          title: "Setting up your environment",
          duration: "20:45",
          videoUrl: "https://example.com/video2",
        ),
        Chapter(
          id: 3,
          title: "Your first Flutter app",
          duration: "25:15",
          videoUrl: "https://example.com/video3",
        ),
      ],
      totalDuration: "1:01:30",
      totalChapters: 3,
    ),
    VideoCourseModel(
      id: 2,
      title: "Web Development Fundamentals",
      subtitle: "Master HTML, CSS, and JavaScript",
      imageUrl: "https://picsum.photos/400/301",
      category: "Web Development",
      chapters: [
        Chapter(
          id: 1,
          title: "HTML Basics",
          duration: "30:00",
          videoUrl: "https://example.com/video4",
        ),
        Chapter(
          id: 2,
          title: "CSS Styling",
          duration: "45:00",
          videoUrl: "https://example.com/video5",
        ),
        Chapter(
          id: 3,
          title: "JavaScript Essentials",
          duration: "60:00",
          videoUrl: "https://example.com/video6",
        ),
      ],
      totalDuration: "2:15:00",
      totalChapters: 3,
    ),
    VideoCourseModel(
      id: 3,
      title: "Python for Data Science",
      subtitle: "Learn data analysis and visualization with Python",
      imageUrl: "https://picsum.photos/400/302",
      category: "Data Science",
      chapters: [
        Chapter(
          id: 1,
          title: "Python Basics",
          duration: "40:00",
          videoUrl: "https://example.com/video7",
        ),
        Chapter(
          id: 2,
          title: "Data Analysis with Pandas",
          duration: "55:00",
          videoUrl: "https://example.com/video8",
        ),
        Chapter(
          id: 3,
          title: "Data Visualization",
          duration: "45:00",
          videoUrl: "https://example.com/video9",
        ),
      ],
      totalDuration: "2:20:00",
      totalChapters: 3,
    ),
    VideoCourseModel(
      id: 4,
      title: "UI/UX Design Principles",
      subtitle: "Create beautiful and functional user interfaces",
      imageUrl: "https://picsum.photos/400/303",
      category: "Design",
      chapters: [
        Chapter(
          id: 1,
          title: "Design Fundamentals",
          duration: "35:00",
          videoUrl: "https://example.com/video10",
        ),
        Chapter(
          id: 2,
          title: "User Research",
          duration: "40:00",
          videoUrl: "https://example.com/video11",
        ),
        Chapter(
          id: 3,
          title: "Prototyping",
          duration: "50:00",
          videoUrl: "https://example.com/video12",
        ),
      ],
      totalDuration: "2:05:00",
      totalChapters: 3,
    ),
    VideoCourseModel(
      id: 5,
      title: "Machine Learning Basics",
      subtitle: "Introduction to ML algorithms and applications",
      imageUrl: "https://picsum.photos/400/304",
      category: "Machine Learning",
      chapters: [
        Chapter(
          id: 1,
          title: "Introduction to ML",
          duration: "45:00",
          videoUrl: "https://example.com/video13",
        ),
        Chapter(
          id: 2,
          title: "Supervised Learning",
          duration: "60:00",
          videoUrl: "https://example.com/video14",
        ),
        Chapter(
          id: 3,
          title: "Unsupervised Learning",
          duration: "55:00",
          videoUrl: "https://example.com/video15",
        ),
      ],
      totalDuration: "2:40:00",
      totalChapters: 3,
    ),
    VideoCourseModel(
      id: 6,
      title: "DevOps Fundamentals",
      subtitle: "Learn CI/CD, Docker, and Kubernetes",
      imageUrl: "https://picsum.photos/400/305",
      category: "DevOps",
      chapters: [
        Chapter(
          id: 1,
          title: "Introduction to DevOps",
          duration: "30:00",
          videoUrl: "https://example.com/video16",
        ),
        Chapter(
          id: 2,
          title: "Docker Basics",
          duration: "45:00",
          videoUrl: "https://example.com/video17",
        ),
        Chapter(
          id: 3,
          title: "Kubernetes Overview",
          duration: "50:00",
          videoUrl: "https://example.com/video18",
        ),
      ],
      totalDuration: "2:05:00",
      totalChapters: 3,
    ),
  ];

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
          Expanded(
            child: Padding(
              padding: widget.isMobile
                  ? const EdgeInsets.all(16.0)
                  : EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                      vertical: 32,
                    ),
              child: CoursesList(
                isMobile: widget.isMobile,
                courses: courses,
              ),
            ),
          ),
        ],
      ),
    );
  }
}