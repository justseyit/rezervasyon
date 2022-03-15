import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MailToRow extends StatelessWidget {
  const MailToRow({Key? key, required this.displayName, this.email}) : super(key: key);


  final String displayName;
  final String? email;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(email != null ? displayName + ': ' : displayName),
        email != null ? TextButton(
          onPressed: () async {
            if (await canLaunch('mailto:$email')) {
              await launch(
                'mailto:$email',
                forceSafariVC: false,
                forceWebView: false,
                enableJavaScript: false,
                enableDomStorage: false,
              );
            } else {
              throw 'Could not launch mailto:$email';
            }
          },
          onLongPress: (){
            FlutterClipboard.copy(email!).then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('İletişim bilgisi kopyalandı.'),
            )));
          },
          child: Text(email!),
        ) : Container(),
      ],
    );
  }
}
