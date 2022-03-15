import 'package:rezervasyon/models/news_category.dart';
import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({Key? key, required this.category}) : super(key: key);

  final NewsCategory category;
  @override
  Widget build(BuildContext context) {
    final TextStyle tabTextStyle = TextStyle(fontSize: 20);
    return Text('${category.title}', style: tabTextStyle);
  }
}
