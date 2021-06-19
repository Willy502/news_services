import 'package:flutter/material.dart';

class NewsWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title(),
        SizedBox(height: 8.0),
        _imageContainer(context),
        SizedBox(height: 8.0),
        _dateContainer(context),
        SizedBox(height: 8.0),
        Divider()
      ],
    );
  }

  Widget _title() {
    return Text('News Title', style: TextStyle(
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

  Widget _dateContainer(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      child: Row(
        children: [
          Expanded(child: Container()),
          Text('17/05/2021', style: TextStyle(
            color: Colors.black
          ))
        ],
      ),
    );
  }

}