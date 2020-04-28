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
    return Center(
      child: InkWell(
        onTap: () {
          widget.onTap(widget.wrapNetflikss);
        },
        child: Card(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imgPath), fit: BoxFit.cover),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text(widget.wrapNetflikss.info.label),
                  subtitle: Text('quick description?'),
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text('todo see more'),
                      onPressed: () {
                        print("todo want to see more");
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
