import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({Key? key, required this.content}) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () async{
        await Share.share(content);
      },
      borderRadius: BorderRadius.circular(100),
      child: Container(
        width: size.width / 8,
        height: size.width / 8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100)
        ),
        child: Icon(Icons.share_outlined, size: 35,),
      ),
    );
  }
}
