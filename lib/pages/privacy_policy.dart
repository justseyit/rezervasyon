import 'package:rezervasyon/blocs/theme/app_theme_cubit.dart';
import 'package:rezervasyon/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final AppThemeCubit appThemeCubit = BlocProvider.of<AppThemeCubit>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            BlocBuilder<AppThemeCubit, ThemeData>(
              bloc: appThemeCubit,
              builder: (context, theme) {
                return CustomAppBar(
                  appBarType: AppBarType.Back,
                  isColorBlack: (() {
                    switch (theme.brightness) {
                      case Brightness.dark:
                        return false;

                      case Brightness.light:
                        return true;
                    }
                  }()),
                );
              },
            ),
            Container(
              width: size.width * .9,
              height: size.height * (13.4 / 16),
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'GİZLİLİK POLİTİKASI\n',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '© Copyright 2019 rezervasyon.com tüm hakları saklıdır. Kod, haber, resim, röportaj gibi her türlü içeriğinin tüm telif hakları rezervasyon.com’a aittir. rezervasyon.com sitesinde yer alan bütün yazılar, materyaller, resimler, ses dosyaları, animasyonlar, videolar, dizayn, tasarım ve düzenlemelerimizin telif hakları 5846 numaralı yasa ile korunmaktadır. Bunlar rezervasyon.com’un yazılı izni olmaksızın ticari olarak herhangi bir şekilde kopyalanamaz, dağıtılamaz, değiştirilemez, yayınlanamaz. İzinsiz ve kaynak belirtilmeksizin kopyalama ve kullanımı yapılamaz. rezervasyon.com’daki harici linkler ayrı bir sayfada açılır ve rezervasyon.com, harici bağlantılardan sorumlu değildir. Yayınlanan yazı ve yorumlardan yazarları sorumludur. rezervasyon.com’da hiçbir bildirim yapmadan, herhangi bir zaman değişikliğe gidebilir. Bu sitedeki bilgilerden kaynaklı hataların hiçbirinden sorumlu değildir.',
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'PRIVACY POLICY\n',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'We will keep your information confidential except where disclosure is required or permitted by law (for example to government bodies and law enforcement agencies). Generally, we will only use your information within the rezervasyon.com However, sometimes the rezervasyon.com uses third parties to process your information. rezervasyon.com requires these third parties to comply strictly with its instructions and the rezervasyon.com requires that they do not use your personal information for their own business purposes, unless you have explicitly consented to the use of your personal information in this way. When you interact with the rezervasyon.com we sometimes receive personal information about you. For example, if you write to us or sign up to a newsletter, you might tell us who you are, how we can contact you and what you think of the rezervasyon.com and its services. When you use rezervasyon.com online services, we use cookies and collect IP addresses. You can find out more about this in the rezervasyon.com cookies section of our full Privacy Policy.',
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
