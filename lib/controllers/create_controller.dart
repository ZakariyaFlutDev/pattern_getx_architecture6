import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

import '../model/post_model.dart';
import '../service/http_service.dart';

class CreateController extends GetxController {
  var isLoading = false.obs;

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  Future<bool> apiCreatePost() async {
    isLoading(true);

    String title = titleController.text.toString().trim();
    String content = contentController.text.toString().trim();

    Post post = Post(id: 101, title: title, body: content, userId: 101);

    var response =
        await Network.POST(Network.API_CREATE, Network.paramsCreate(post));
    isLoading(false);

    return response != null;
  }
}
