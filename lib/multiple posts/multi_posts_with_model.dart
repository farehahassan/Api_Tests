import 'package:flutter/material.dart';
import 'package:practice/multiple%20posts/multi_model.dart';
import 'package:practice/multiple%20posts/multi_post_services.dart';

class MultiPostsWithModel extends StatefulWidget {
  const MultiPostsWithModel({super.key});

  @override
  State<MultiPostsWithModel> createState() => _MultiPostsWithModelState();
}

class _MultiPostsWithModelState extends State<MultiPostsWithModel> {
  List<MultiPostWithModel> postModel = [];
  bool isready = false;

  _getmultiPostWithModel() {
    setState(() {
      isready = true;
    });
    MultiPostServices().getMultiPostWithModel().then((value) {
      setState(() {
        postModel = value ?? [];
        isready = false;
      });
    });
  }

  @override
  void initState() {
    _getmultiPostWithModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isready
          ? Center(
              child: CircularProgressIndicator(),
            )
          : postModel.isNotEmpty
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(
                          postModel[index].title ?? "",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(postModel[index].body ?? ""),
                      ),
                    );
                  },
                  itemCount: postModel.length,
                )
              : Center(
                  child: Text("data not available"),
                ),
    );
  }
}
