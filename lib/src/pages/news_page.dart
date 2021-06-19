import 'package:flutter/material.dart';
import 'package:news/src/widgets/news_widget.dart';

class NewsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
        actions: [
          IconButton(onPressed: () => _logout(context), icon: Icon(Icons.logout))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _addNews(context)
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        width: size.width,
        height: size.height,
        child: ListView(
          children: [
            NewsWidget(),
          ],
        ),
      ),
    );
  }

  void _addNews(BuildContext context) {
    Navigator.pushNamed(context, 'detail_news');
  }

  void _logout(BuildContext context) {
    Navigator.pushReplacementNamed(context, 'login');
  }
}