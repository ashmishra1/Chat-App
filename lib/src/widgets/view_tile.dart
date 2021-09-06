import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget viewTile(Map _userdetl) {
  return ListTile(
      title: Row(
        children: [
          CircleAvatar(
            maxRadius: 20,
            backgroundImage: NetworkImage(_userdetl['photoUrl']),
          ),
          SizedBox(
            width: 20,
          ),
          Text(_userdetl['name']),
        ],
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(Icons.send),
      ));
}
