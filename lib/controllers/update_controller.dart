import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

import '../model/post_model.dart';
import '../service/http_service.dart';

class UpdateController extends GetxController{
  var isLoading = false.obs;

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  Future<bool> apiUpdatePost(Post post) async {
    isLoading(true);
    String title = titleController.text.toString().trim();
    String content = contentController.text.toString().trim();

    post.title = title;
    post.body = content;

    var response = await Network.PUT(
        Network.API_UPDATE + post.id.toString(),
        Network.paramsUpdate(post));

    isLoading(false);
    return response != null;

  }

}