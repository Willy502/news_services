import 'package:flutter/material.dart';
import 'package:news/src/models/news_model.dart';
import 'package:news/src/providers/news_provider.dart';
import 'package:news/src/shared/preferences.dart';
import 'package:news/src/widgets/news_widget.dart';

class NewsPage extends StatefulWidget {

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final preferences = Preferences();

  final _newsProvider = NewsProvider();

  List<NewsModel> news = [];

  getData() async {
    news = await _newsProvider.loadNews();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

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
        child: RefreshIndicator(
          child: ListView.builder(
            itemCount: news.length,
            itemBuilder: (BuildContext context, int position) {
              return NewsWidget(news: news[position]);
            }
          ),
          onRefresh: onRefreshIndicator,
        ),
      ),
    );
  }

  Future onRefreshIndicator() async {
    news.clear();
    news = await _newsProvider.loadNews();
    setState(() {});
  }

  void _addNews(BuildContext context) {
    Navigator.pushNamed(context, 'add_news');
  }

  void _logout(BuildContext context) {
    preferences.token = '';
    Navigator.pushReplacementNamed(context, 'login');
  }
}