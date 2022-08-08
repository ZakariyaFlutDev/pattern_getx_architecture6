import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pattern_getx_architecture6/model/post_model.dart';
import 'package:pattern_getx_architecture6/pages/create_post.dart';
import 'package:pattern_getx_architecture6/pages/home_page.dart';
import 'package:pattern_getx_architecture6/pages/update_post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      getPages: [
        GetPage(name: '/home_page', page: () => HomePage()),
        GetPage(name: '/create_post', page: () => CreatePost()),
        GetPage(name: '/update_post', page: () => UpdatePost(post:Post(id: 0, title: "title", body: "body", userId: 0) ,)),
      ],
      routes: {

      },
    );
  }
}
