import 'package:flutter/material.dart';
import 'package:news/src/models/news_model.dart';

class NewsWidget extends StatelessWidget {

  final NewsModel news;

  NewsWidget({required this.news});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => _goToDetail(context, news),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(news.title!),
          SizedBox(height: 8.0),
          _imageContainer(context),
          SizedBox(height: 8.0),
          _dateContainer(context, news.date!),
          SizedBox(height: 8.0),
          Divider()
        ],
      ),
    );
  }

  void _goToDetail(BuildContext context, NewsModel news) {
    Navigator.pushNamed(context, 'detail_news', arguments: news);
  }

  Widget _title(String title) {
    return Text(title, style: TextStyle(
      fontSize: 18.0,
      color: Colors.black,
      fontWeight: FontWeight.bold
    ));
  }

  Widget _imageContainer(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.width - 32.0,
      decoration: BoxDecoration(
        color: Colors.green
      )
    );
  }

  Widget _dateContainer(BuildContext context, String date) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      child: Row(
        children: [
          Expanded(child: Container()),
          Text(date, style: TextStyle(
            color: Colors.black
          ))
        ],
      ),
    );
  }

}