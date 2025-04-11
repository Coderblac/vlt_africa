import 'package:flutter/material.dart';

class CategoryModel {
  final String title;
  // final IconData icon;

  CategoryModel({
    // required this.icon,
    required this.title
  });
  
}

class EbookModel {
  // final int id;
  final String title;
  final String subtitle;
  final String imageUrl;
  final CategoryModel category;

  EbookModel({
  //  required this.id,
   required this.title,
   required this.subtitle,
   required this.imageUrl,
   required this.category
  });
}