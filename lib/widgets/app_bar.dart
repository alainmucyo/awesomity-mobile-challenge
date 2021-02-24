import 'package:awesomity_challenge/utils/constants.dart';
import 'package:flutter/material.dart';

Widget buildMainAppBar(){
  return AppBar(
    title: Image.asset(
      "assets/images/IW_logo.png",
      width: 38,
      height: 100,
      color: Colors.grey[300],
    ),
    elevation: 0,
    actions: [
      IconButton(
          icon: Icon(Icons.search),
          color: Colors.grey[300],
          onPressed: () {}),
      PopupMenuButton(
        icon: Icon(
          Icons.filter_list,
          color: Colors.grey[300],
        ),
        onSelected: (value) {
          print(value);
        },
        itemBuilder: (context) {
          var list = List<PopupMenuEntry<Object>>();
          list.add(
            PopupMenuItem(
                enabled: false,
                child: Text(
                  "SELECT PRIORITY",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          );
          list.add(
            PopupMenuDivider(
              // height: 20,
            ),
          );
          list.add(
            PopupMenuItem(
                child: Text(
                  "Low priority",
                  style: TextStyle(color: Constants.PRIMARY_LIGHT_COLOR),
                )),
          );
          list.add(
            PopupMenuItem(
              child: Text("Medium priority",
                  style: TextStyle(color: Constants.PRIMARY_LIGHT_COLOR)),
              value: 2,
            ),
          );
          list.add(
            PopupMenuItem(
              child: Text("High priority",
                  style: TextStyle(color: Constants.PRIMARY_LIGHT_COLOR)),
              value: 3,
            ),
          );

          return list;
        },
      )
    ],
  );
}