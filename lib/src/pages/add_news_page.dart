import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class AddNewsPage extends StatefulWidget {

  @override
  _AddNewsPageState createState() => _AddNewsPageState();
}

class _AddNewsPageState extends State<AddNewsPage> {
  
  final _dateController = TextEditingController();
  String _date = '';

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
                    controller: _dateController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Date',
                      labelText: 'Date'
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

  void _createNews(BuildContext context) {
    Navigator.pop(context);
  }
}