import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget {
  final bool isMobile;
  final String title; //final IconData icon;
  const CategoryCard({super.key, required this.isMobile, required this.title, });//required this.icon

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      hoverColor: Colors.transparent,
      onTap: () {
        
      },
      child: Card(
        // margin: const EdgeInsets.only(right: 10),
        child: Container(
          // width: widget.isMobile ? 60 : 200,
          // height: widget.isMobile ? 40 : 200,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Text(
            widget.title,
            style: TextStyle(fontSize: widget.isMobile ? 8 : 12,), //widget.title !=null ? Theme.of(context).colorScheme.primary: Colors.grey,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}