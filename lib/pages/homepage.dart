import 'package:flutter/material.dart';
import '../backend/functions.dart';
import '../components/appbar.dart';
import '../components/newstile.dart';
import '../components/searchbar.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';

class NewsPage extends StatefulWidget {
  final String screenType;
  const NewsPage({Key? key, required this.screenType}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late Future<List> news;
  @override
  void initState() {
    super.initState();
    news = fetchNews(widget.screenType);
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: appBar(
        title1: widget.screenType,
        title2: '',
      ),
      body: Column(
        children: [
          SearchBar(
            searchInCategory: widget.screenType,
          ),
          Expanded(
            child: SizedBox(
              width: w,
              child: FutureBuilder<List>(
                future: fetchNews(widget.screenType),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return NewsTile(
                            imageUrl: snapshot.data![index]['urlToImage'] ??
                                Constant.imageUrl,
                            title: snapshot.data![index]['title'],
                            time: snapshot.data![index]['publishedAt'],
                            description:
                                snapshot.data![index]['description'] ?? '',
                            targetUrl: snapshot.data![index]['url']);
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
