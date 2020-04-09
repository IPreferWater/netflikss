import 'package:flutter/material.dart';
import 'package:netflikss/model/Serie.dart';


class CardSerie extends StatefulWidget{

  final Serie serie;

  CardSerie({
    @required this.serie,
  });

  _CardState createState() => _CardState();

}
class _CardState extends State<CardSerie> {

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Serie serie = widget.serie;
    return Center(
      child: InkWell(
        onTap: () {
          print("read serie ${serie.label}");
        },
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
               ListTile(
                title: Text(serie.label),
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
    );
  }
}