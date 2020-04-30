import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:netflikss/model/wrap_netflikss.dart';

class CardNetflikss extends StatefulWidget {
  final WrapNetflikss wrapNetflikss;
  final void Function(WrapNetflikss wrapNetflikss) onTap;

  CardNetflikss({@required this.wrapNetflikss, @required this.onTap});

  _CardState createState() => _CardState();
}

class _CardState extends State<CardNetflikss> {
  String imgPath;

  @override
  void initState() {
    super.initState();
    imgPath =
        'http://localhost:7171/${widget.wrapNetflikss.info.stockPath}/${widget.wrapNetflikss.info.directory}/${widget.wrapNetflikss.info.img}';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap(widget.wrapNetflikss);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imgPath), fit: BoxFit.cover),
          ),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  color: Colors.black.withOpacity(0.25),
                  child: Container(
                    margin: EdgeInsets.only(left: 8, right: 2),
                    child: Text(widget.wrapNetflikss.info.label,
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
