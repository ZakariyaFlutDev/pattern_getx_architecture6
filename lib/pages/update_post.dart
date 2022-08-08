import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:pattern_getx_architecture6/controllers/update_controller.dart';
import 'package:pattern_getx_architecture6/model/post_model.dart';
import 'package:pattern_getx_architecture6/pages/home_page.dart';
import 'package:pattern_getx_architecture6/service/http_service.dart';

class UpdatePost extends StatefulWidget {
  const UpdatePost({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  State<UpdatePost> createState() => _UpdatePostState();
}

class _UpdatePostState extends State<UpdatePost> {
  final _controller = Get.put(UpdateController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.titleController.text = widget.post.title!;
      _controller.contentController.text = widget.post.body!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Update Post",
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
        ),
        body: Obx(() => Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          height: 55,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey.shade300),
                          child: TextField(
                            controller: _controller.titleController,
                            decoration: InputDecoration(
                                hintText: "Title",
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                                border: InputBorder.none),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: widget.post.body!.length < 50 ? 50 : 100,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey.shade300),
                          child: TextField(
                            maxLines: 20,
                            minLines: 2,
                            controller: _controller.contentController,
                            decoration: InputDecoration(
                                hintText: "Content",
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                                border: InputBorder.none),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 55,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.blue),
                          child: Center(
                              child: GestureDetector(
                            onTap: () {
                              _controller.apiUpdatePost(widget.post).then((value) => {
                                if(value) Get.offAll(HomePage()),
                              });
                            },
                            child: Text(
                              "Update Post",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
                _controller.isLoading()
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : SizedBox.shrink(),
              ],
            )));
  }
}
