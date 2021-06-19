import 'package:flutter/material.dart';
import 'package:news/src/models/news_model.dart';

class DetailNewsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final news = ModalRoute.of(context)!.settings.arguments as NewsModel;

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(news.title!),
        actions: [
          IconButton(onPressed: () => _editNews(context), icon: Icon(Icons.edit))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Container(
          width: size.width,
          height: size.height,
          child: ListView(
            children: [
              _dateContainer(context, news.date!),
              SizedBox(height: 8.0),
              _topContainer(context),
              SizedBox(height: 16.0),
              Text(news.description!, style: TextStyle(
                color: Colors.black,
                fontSize: 16.0
              )),
            ],
          ),
        ),
      ),
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

  Widget _topContainer(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.width - 32.0,
      decoration: BoxDecoration(
        color: Colors.green
      )
    );
  }

  void _editNews(BuildContext context) {
    Navigator.pushNamed(context, 'add_news');
  }
}