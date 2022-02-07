import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_example/wedget/user_details.dart';
import 'package:matcher/matcher.dart';
import 'package:flutter_api_example/pages/user_list_widget.dart';

userListWidget(
    String picture, String fullName, String email, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  UserDetailsPage(fullName: fullName, imagePath: picture)));
    },
    child: Card(
      margin: const EdgeInsets.all(10),
      child: Container(
        // color: Colors.grey,
        padding: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.green,
              backgroundImage: NetworkImage(picture),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fullName,
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  email,
                  style: const TextStyle(fontSize: 12.0),
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}
