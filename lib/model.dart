class CategoryModel {
  final String title;

  CategoryModel({
    required this.title
  });
  
}

class Chapter {
  final int id;
  final String title;
  final String duration;
  final String videoUrl;
  final bool isCompleted;

  Chapter({
    required this.id,
    required this.title,
    required this.duration,
    required this.videoUrl,
    this.isCompleted = false,
  });
}

class VideoCourseModel {
  final int id;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String category;
  final List<Chapter> chapters;
  final String totalDuration;
  final List<Comments>?comments;
  final int totalChapters;

  VideoCourseModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.category,
    required this.chapters,
    required this.totalDuration,
    required this.totalChapters,
    this.comments, 
  });
}
class Comments{
  final String comment;
  final String userName;
  final String? userImageUrl;

  Comments({
    required this.comment,
    required this.userName,
    this.userImageUrl,
  });

}