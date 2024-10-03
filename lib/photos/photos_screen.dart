// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:practice/photos/photos_services.dart';

// class PhotosScreen extends StatefulWidget {
//   const PhotosScreen({super.key});

//   @override
//   State<PhotosScreen> createState() => _PhotosScreenState();
// }

// class _PhotosScreenState extends State<PhotosScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: FutureBuilder(
//           future: PhotosServices().getPhotos(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                 itemBuilder: (context, index) {
//                   return Card(
//                     child: ListTile(
//                       leading:
//                           Text(snapshot.data![index]["albumId"].toString()),
//                       title: Text(snapshot.data?[index]["title"]),
//                       subtitle: Image.network(
//                         snapshot.data?[index]["thumbnailUrl"] ?? '',
//                         width: 300,
//                         height: 300,
//                         fit: BoxFit.cover,
//                         errorBuilder: (context, error, stackTrace) {
//                           return Icon(Icons.error);
//                         },
//                       ),
//                     ),
//                   );
//                 },
//                 itemCount: snapshot.data?.length,
//               );
//             } else {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           }),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:practice/photos/photos_services.dart';

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({super.key});

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photos'),
      ),
      body: FutureBuilder(
        future: PhotosServices().getPhotos(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                final photo = snapshot.data?[index];
                return Card(
                  child: ListTile(
                    leading: Text((index + 1).toString()), // Display index + 1
                    title: Text(photo["title"] ?? 'No Title'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Album ID: ${photo["albumId"]}'),
                        Image.network(
                          photo["url"] ?? '', // Ensure valid image URL
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          // errorBuilder: (context, error, stackTrace) {
                          //   return Icon(Icons.error);
                          // },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading photos'));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
