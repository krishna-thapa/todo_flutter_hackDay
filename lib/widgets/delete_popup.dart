import 'package:flutter/material.dart';

class DeletePopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Conformation needed!"),
      content: Text("Delete the todo item?"),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text("Delete")),
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text("Cancel"))
      ],
    );
  }
}
