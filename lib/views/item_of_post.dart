import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pattern_getx_architecture6/controllers/home_controller.dart';

import '../model/post_model.dart';

Widget itemOfPost(Post post, HomeController _controller) {
  return Slidable(
    startActionPane: ActionPane(motion: BehindMotion(), children: [
      SlidableAction(
        onPressed: (context) {
          _controller.apiPostUpdate(post, context);
        },
        backgroundColor: Color(0xFF0392CF),
        foregroundColor: Colors.white,
        icon: Icons.edit,
        label: 'Update',
      ),
    ]),
    endActionPane: ActionPane(
      motion: ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (context) {
            _controller.apiPostDelete(post);
          },
          backgroundColor: Color(0xFFFE4A49),
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ),
      ],
    ),
    child: Container(
      padding: EdgeInsets.only(right: 20, top: 20, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title!.toUpperCase(),
            style:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(post.body.toString()),
        ],
      ),
    ),
  );
}