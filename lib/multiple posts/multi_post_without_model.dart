import 'package:flutter/material.dart';
import 'package:practice/multiple%20posts/multi_post_services.dart';

//////////////////////////////// All comment code is for List view and the uncommect running code is for future builder /////////////////////////////////////

class MultiPostWithoutModel extends StatefulWidget {
  const MultiPostWithoutModel({super.key});

  @override
  State<MultiPostWithoutModel> createState() => _MultiPostWithoutModelState();
}

class _MultiPostWithoutModelState extends State<MultiPostWithoutModel> {
  // List<dynamic> postModel = [];
  // bool isready = false;
  // _getmultiPostWithoutModel() {
  //   setState(() {
  //     isready = true;
  //   });
  //   MultiPostServices().getMultiPostWithoutModel().then((value) {
  //     setState(() {
  //       postModel = value!;
  //       isready = false;
  //     });
  //   }).onError((error, stackTrace) {
  //     print(error);
  //   });
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   _getmultiPostWithoutModel();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:

          //  isready == true
          //     ? Center(
          //         child: CircularProgressIndicator(),
          //       )
          //     : postModel.isNotEmpty?
          // ? ListView.builder(
          //     itemBuilder: (context, index) {
          //       return Card(
          //         child: ListTile(
          //           title: Text(
          //             postModel[index]['title'] ?? "",
          //             style: TextStyle(
          //               fontSize: 20,
          //               fontWeight: FontWeight.bold,
          //               color: Colors.pink,
          //             ),
          //           ),
          //           subtitle: Text(postModel[index]['body'] ?? ""),
          //         ),
          //       );
          //     },
          //     itemCount: postModel.length,
          //   )

          FutureBuilder(
        future: MultiPostServices().getMultiPostWithoutModel(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      snapshot.data?[index]['title'] ?? "",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    subtitle: Text(snapshot.data?[index]['body'] ?? ""),
                  ),
                );
              },
              itemCount: snapshot.data?.length,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      // : Center(
      //     child: Text("No data found"),
      //   ),
    );
  }
}
