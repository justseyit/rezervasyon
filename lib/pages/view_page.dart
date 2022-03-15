/*import 'package:rezervasyon/blocs/theme/app_theme_cubit.dart';
import 'package:rezervasyon/models/news.dart';
import 'package:rezervasyon/widgets/banner_ad_container.dart';
import 'package:rezervasyon/widgets/custom_app_bar.dart';
import 'package:rezervasyon/widgets/news_slider.dart';
import 'package:rezervasyon/widgets/share_button.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewPage extends StatelessWidget {
  const ViewPage({Key? key, required this.htmlContent, required this.title, required this.urlToShare, this.urlToImage, this.id, this.sliderNews}) : super(key: key);

  final String htmlContent;
  final String title;
  final String? urlToImage;
  final String? id;
  final String urlToShare;
  final List<News>? sliderNews;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final AppThemeCubit appThemeCubit = BlocProvider.of<AppThemeCubit>(context);
    return BlocBuilder<AppThemeCubit, ThemeData>(
      bloc: appThemeCubit,
      builder: (context, theme) {
        print(theme.brightness);
        return Scaffold(
          body: Container(
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                CustomAppBar(
                  appBarType: AppBarType.Back,
                  isColorBlack: (() {
                    switch (theme.brightness) {
                      case Brightness.dark:
                        return false;

                      case Brightness.light:
                        return true;
                    }
                  }()),
                ),
                Container(
                  height: size.height * (11 / 16),
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              child: Text(
                                title,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          (() {
                            if (urlToImage != null) {
                              return Container(
                                width: size.width * .99,
                                height: size.height * .3,
                                child: ExtendedImage.network(
                                  urlToImage!,
                                  cacheKey: id,
                                  imageCacheName: 'View_page_$id',
                                  cache: true,
                                  fit: BoxFit.fill,
                                ),
                              );
                            } else
                              return Container();
                          }()),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: HtmlWidget(
                                htmlContent,
                                enableCaching: true,
                                onTapUrl: (url) async {
                                  if (await canLaunch(url)) {
                                    await launch(
                                      url,
                                      forceSafariVC: true,
                                      forceWebView: true,
                                      enableJavaScript: true,
                                      enableDomStorage: true,
                                    );
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ShareButton(
                                content: urlToShare,
                              ),
                              SizedBox(
                                width: size.width / 50,
                              )
                            ],
                          ),
                          (() {
                            if (sliderNews != null) {
                              return Column(
                                children: [
                                  Container(
                                    width: size.width * 99,
                                    child: Text(
                                      'Diğer Haberler',
                                      style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: size.width * .99,
                                    child: NewsSlider(
                                      width: size.width,
                                      height: size.height / 3,
                                      scrollDirection: Axis.horizontal,
                                      news: sliderNews!,
                                    ),
                                  ),
                                ],
                              );
                            } else
                              return SizedBox();
                          }()),
                        ],
                      ),
                    ),
                  ),
                ),
                BannerAdContainer(
                  width: size.width,
                  height: size.height * (1 / 16),
                ),
                SizedBox(
                  height: size.height * (1.4 / 16),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
*/