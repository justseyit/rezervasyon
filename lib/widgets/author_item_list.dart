import 'package:rezervasyon/models/author.dart';
import 'package:rezervasyon/widgets/author_list_item.dart';
import 'package:flutter/material.dart';

class AuthorItemList extends StatelessWidget {
  const AuthorItemList({Key? key, required this.authors}) : super(key: key);

  final List<Author> authors;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      primary: false,
      children: getItemsFromAuthors(authors, context),
    );
  }

  List<Widget> getItemsFromAuthors(List<Author> authors, BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    List<Widget> items = [];
    for (Author author in authors) {
      items.add(AuthorListItem(author: author));
    }
    items.add(SizedBox(height: size.height / 15));
    return items;
  }
}
