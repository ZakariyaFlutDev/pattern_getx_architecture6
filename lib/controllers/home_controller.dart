// ignore_for_file: prefer_collection_literals

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

import '../model/post_model.dart';
import '../pages/update_post.dart';
import '../service/http_service.dart';

class HomeController extends GetxController{
  var isLoading = false.obs;
  var items = <Post>[].obs;

  Future apiPostList() async {
    isLoading(true);

    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      items.value = Network.parsePostList(response);
    } else {
      items.value = [];
    }
    isLoading(false);

  }

  Future<bool> apiPostDelete(Post post) async {
    isLoading(true);
    var response = await Network.DEL(
        Network.API_DELETE + post.id.toString(), Network.paramsEmpty());

    isLoading(false);

    return response!=null;
  }

  void apiPostUpdate(Post post, BuildContext context) {
    Navigator.of(context)
        .push( MaterialPageRoute(builder: (BuildContext context) {
      return UpdatePost(post: post);
    }));
  }
}