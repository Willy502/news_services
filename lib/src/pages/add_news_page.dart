import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:news/src/models/news_model.dart';
import 'package:news/src/providers/news_provider.dart';

class AddNewsPage extends StatefulWidget {

  @override
  _AddNewsPageState createState() => _AddNewsPageState();
}

class _AddNewsPageState extends State<AddNewsPage> {
  
  final _dateController = TextEditingController();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String? _errorDescription, _errorTitle, _errorDate;
  String _date = '';

  final _newsProvider = NewsProvider();

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
                controller: _descriptionController,
                textAlignVertical: TextAlignVertical.top,
                keyboardType: TextInputType.text,
                maxLines: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                  hintText: 'Description',
                  labelText: 'Description',
                  alignLabelWithHint: true,
                  errorText: _errorDescription
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
                    controller: _titleController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Title',
                      labelText: 'Title',
                      errorText: _errorTitle
                    ),
                    //onChanged: bloc.changeEmail,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: _dateController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Date',
                      labelText: 'Date',
                      errorText: _errorDate
                    ),
                    onTap: () {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      _selectDate(context);
                    }, //onChanged: bloc.changeEmail,
                  ),
                  
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      locale: Locale('es', 'ES')
    );

    if (picked != null) {
      setState(() {
        String formatDate = DateFormat('dd/MM/yyyy').format(picked);
        _date = formatDate;
        _dateController.text = _date;
      });
    }
  }

  bool _validateFields() {
    bool fully = true;
    String title = _titleController.text;
    String date = _dateController.text;
    String description = _descriptionController.text;
    _errorDate = null;
    _errorTitle = null;
    _errorDescription = null;

    if (title == '') {
      _errorTitle = 'Campo Obligatorio';
      fully = false;
    }

    if (date == '') {
      _errorDate = 'Campo Obligatorio';
      fully = false;
    }

    if (description == '') {
      _errorDescription = 'Campo Obligatorio';
      fully = false;
    }

    setState(() {});

    return fully;
  }

  void _createNews(BuildContext context) async {

    String title = _titleController.text;
    String date = _dateController.text;
    String description = _descriptionController.text;

    if (_validateFields()) {
      final news = NewsModel();
      news.date = date;
      news.title = title;
      news.description = description;

      if (await _newsProvider.createNews(news: news)) {
        Navigator.pop(context);
      }
      
    }
    
  }
}