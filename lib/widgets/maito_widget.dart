import 'package:flutter/material.dart';
import 'mailto_row.dart';

class MailTo extends StatelessWidget {
  const MailTo({Key? key, required this.jobTitle, required this.rows}) : super(key: key);

  final String jobTitle;
  final List<MailToRow> rows;

  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
    return Column(
      children: [
        Text(
          jobTitle,
          style: titleStyle,
          textAlign: TextAlign.center,
        ),
        Column(
          children: rows,
        )
      ],
    );
  }
}
