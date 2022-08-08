import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:pattern_getx_architecture6/controllers/create_controller.dart';
import 'package:pattern_getx_architecture6/model/post_model.dart';
import 'package:pattern_getx_architecture6/pages/home_page.dart';
import 'package:pattern_getx_architecture6/service/http_service.dart';
class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);


  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {

 final _controller = Get.put(CreateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Post", style: TextStyle(color: Colors.white, fontSize: 28),),
      ),
      body: Obx(
          () => Stack(
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
                            color: Colors.grey.shade300
                        ),
                        child: TextField(
                          controller: _controller.titleController,
                          decoration: InputDecoration(
                              hintText: "Title",
                              hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                              border: InputBorder.none
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 55,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade300
                        ),
                        child: TextField(
                          controller: _controller.contentController,
                          decoration: InputDecoration(
                              hintText: "Content",
                              hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                              border: InputBorder.none
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),

                      Container(
                        height: 55,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.blue
                        ),
                        child: Center(
                            child: GestureDetector(
                              onTap: (){
                                _controller.apiCreatePost().then((value) => {
                                  if(value) Get.offAll(HomePage()),
                                });
                                print("ADD");
                              },
                              child: Text("Add Post", style: TextStyle(color: Colors.white, fontSize: 22),),
                            )
                        ),
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
          )
      )
    );
  }
}
