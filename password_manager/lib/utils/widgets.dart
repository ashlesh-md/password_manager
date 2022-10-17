import 'package:flutter/material.dart';

Widget getTextWidgets(List<String> strings) {
  List<Widget> list = [];
  for (var i = 0; i < strings.length; i++) {
    list.add(Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
          alignment: Alignment.topLeft,
          child: Text('$i.${strings[i]}',
              style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 15,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal)),
        ),
        Divider(
          height: 15,
          thickness: 1,
          indent: 20,
          endIndent: 20,
          color: Colors.grey.shade500,
        )
      ],
    ));
  }
  return Column(children: list);
}
