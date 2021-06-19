import 'package:flutter/material.dart';

class AddNewsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Create News'),
        actions: [
          IconButton(onPressed: () => _createNews(context), icon: Icon(Icons.check))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Container(
          width: size.width,
          height: size.height,
          child: ListView(
            children: [
              _topContainer(context),
              SizedBox(height: 16.0),
              TextField(
                textAlignVertical: TextAlignVertical.top,
                keyboardType: TextInputType.text,
                maxLines: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                  hintText: 'Description',
                  labelText: 'Description',
                  alignLabelWithHint: true
                ),
                //onChanged: bloc.changeEmail,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _topContainer(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      child: Row(
        children: [
          Container(
            height: size.width/3,
            width: size.width/3,
            decoration: BoxDecoration(
              color: Colors.green
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Title',
                      labelText: 'Title'
                    ),
                    //onChanged: bloc.changeEmail,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Date',
                      labelText: 'Date'
                    ),
                    //onChanged: bloc.changeEmail,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _createNews(BuildContext context) {
    Navigator.pop(context);
  }
}