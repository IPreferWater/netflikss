import 'package:flutter/material.dart';
import 'package:netflikss/model/Serie.dart';

class CardSerie extends StatefulWidget {
  final Serie serie;
  final void Function(Serie serie) onTap;

  CardSerie({@required this.serie, @required this.onTap});

  _CardState createState() => _CardState();
}

class _CardState extends State<CardSerie> {
  String imgPath;

  @override
  void initState() {
    super.initState();
    imgPath =
        'http://localhost:7171/${widget.serie.info.stockPath}/${widget.serie.info.directory}/${widget.serie.info.img}';
  }

  @override
  Widget build(BuildContext context) {
    Serie serie = widget.serie;
    return Center(
      child: InkWell(
        onTap: () {
          widget.onTap(widget.serie);
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
                  title: Text(serie.info.label),
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
