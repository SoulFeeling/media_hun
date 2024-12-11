import 'package:flutter/material.dart';
import '../models/category_model.dart';

class SubjectCard extends StatelessWidget {
  final CategoryModel category;

  SubjectCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(category.categoryName ?? '', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          // Add more widgets or interactions here
        ],
      ),
    );
  }
}
