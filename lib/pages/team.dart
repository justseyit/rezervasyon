import 'package:rezervasyon/blocs/theme/app_theme_cubit.dart';
import 'package:rezervasyon/widgets/custom_app_bar.dart';
import 'package:rezervasyon/widgets/mailto_row.dart';
import 'package:rezervasyon/widgets/maito_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Team extends StatelessWidget {
  const Team({Key? key}) : super(key: key);

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
              height: size.height * (13.4 / 16),
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        width: size.width * .99,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MailTo(
                                jobTitle: 'Genel Yayın Yönetmeni / Editor in Chief',
                                rows: [
                                  MailToRow(
                                    displayName: 'Ercan Tekin',
                                    email: 'ercan@rezervasyon.com',
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MailTo(
                                jobTitle: 'İmtiyaz Sahibi / Grantee',
                                rows: [
                                  MailToRow(
                                    displayName: 'Emrah Yedekci',
                                    email: 'info@rezervasyon.com',
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MailTo(
                                jobTitle: 'Haber Editörleri / News Editors',
                                rows: [
                                  MailToRow(
                                    displayName: 'Ercan Tekin',
                                    email: 'ercan@rezervasyon.com',
                                  ),
                                  MailToRow(
                                    displayName: 'Şevket Karakaya',
                                    email: 'sevket@rezervasyon.com',
                                  ),
                                  MailToRow(
                                    displayName: 'Tuğberk Lama',
                                    email: 'tugberk@rezervasyon.com',
                                  ),
                                  MailToRow(
                                    displayName: 'Sefa Yıldırım',
                                    email: 'sefa@rezervasyon.com',
                                  ),
                                  MailToRow(
                                    displayName: 'Harun Gencel',
                                    email: 'harun@rezervasyon.com',
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MailTo(
                                jobTitle: 'İnternet Sorumlu Yazı İşleri Müdürü /\nDirector of internet writing',
                                rows: [
                                  MailToRow(
                                    displayName: 'Kadir Polat',
                                    email: 'kadir@rezervasyon.com',
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MailTo(
                                jobTitle: 'Reklam / Advertise',
                                rows: [
                                  MailToRow(
                                    displayName: 'Şevval Eşkinoğlu',
                                    email: 'sevval@rezervasyon.com',
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MailTo(
                                jobTitle: 'Hukuk Danışmanı / Jurisconsult',
                                rows: [MailToRow(displayName: 'Murat Yılmaz')],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MailTo(
                                jobTitle: 'Site Tasarım ve Yazılım Sorumlusu /\nSite Design and Software Responsible',
                                rows: [
                                  MailToRow(
                                    displayName: 'Tayfun Girici',
                                    email: 'tayfun@rezervasyon.com',
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MailTo(
                                jobTitle: 'CEO',
                                rows: [
                                  MailToRow(
                                    displayName: 'Yasemin Yedekci',
                                    email: 'yasemin@rezervasyon.com',
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MailTo(
                                jobTitle: 'İletişim Bilgileri',
                                rows: [
                                  MailToRow(
                                    displayName: 'E-posta',
                                    email: 'info@rezervasyon.com',
                                  ),
                                  MailToRow(
                                    displayName: 'Prof. Dr. Celal Öker Sokak, No: 3/2,\nŞişli,İstanbul,Türkiye',
                                  ),
                                  MailToRow(
                                    displayName: 'Telefon',
                                    email: '02122505455',
                                  ),
                                ],
                              ),
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
