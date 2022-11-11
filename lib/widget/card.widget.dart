import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  final int number;
  final String ref;
  final double prixTotal;
  final String statut;
  final List<Widget> articles;
  const CardWidget({
    Key? key,
    required this.statut,
    required this.articles,
    required this.number,
    required this.ref,
    required this.prixTotal,
  }) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  "${widget.number}",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                widget.ref,
                style: TextStyle(fontSize: 18),
              ),
              Spacer(),
              Text(
                "\$ ${widget.prixTotal}",
                style: (TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0).copyWith(left: 30, right: 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Wrap(
                  runAlignment: WrapAlignment.start,
                  alignment: WrapAlignment.start,
                  runSpacing: 10,
                  spacing: 10,
                  children: widget.articles,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: (widget.statut == "Confirmed")
                      ? Colors.blue
                      : (widget.statut == "Pinked")
                          ? Colors.orange
                          : (widget.statut == "Processed")
                              ? Colors.cyan
                              : (widget.statut == "Delivered")
                                  ? Colors.green
                                  : Colors.red,
                  borderRadius: BorderRadius.circular(4),
                ),
                width: 70,
                alignment: Alignment.center,
                padding: EdgeInsets.all(4),
                child: Text(
                  widget.statut,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
