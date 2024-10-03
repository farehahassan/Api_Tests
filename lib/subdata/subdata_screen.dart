// import 'package:flutter/material.dart';
// import 'package:practice/subdata/subdata_model.dart';
// import 'package:practice/subdata/subdata_services.dart';

// class SubdataScreen extends StatefulWidget {
//   const SubdataScreen({super.key});

//   @override
//   State<SubdataScreen> createState() => _SubdataScreenState();
// }

// class _SubdataScreenState extends State<SubdataScreen> {
//   bool isready = false;
//   SubDataModel subData = SubDataModel();
//   _getsubDataWithModel() {
//     setState(() {
//       isready = true;
//     });
//     SubdataServices().getSubDataWithModel().then((value) {
//       setState(() {
//         subData = value!;
//         isready = false;
//       });
//     }).onError((error, stackTrace) {
//       isready = false;
//       print(error);
//     });
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     _getsubDataWithModel();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: isready == true
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : Column(
//               children: [
//                 Text(
//                   subData.page.toString(),
//                   style: TextStyle(
//                     color: Colors.teal,
//                     fontSize: 20,
//                   ),
//                 ),
//                 Text(
//                   subData.total.toString(),
//                   style: TextStyle(
//                     color: Colors.teal,
//                     fontSize: 20,
//                   ),
//                 ),
//                 Text(
//                   subData.totalPages.toString(),
//                   style: TextStyle(
//                     color: Colors.teal,
//                     fontSize: 20,
//                   ),
//                 ),
//                 Text(
//                   subData.perPage.toString(),
//                   style: TextStyle(
//                     color: Colors.teal,
//                     fontSize: 20,
//                   ),
//                 ),
//                 Text(
//                   subData.support!.text.toString(),
//                   style: TextStyle(
//                     color: Colors.teal,
//                     fontSize: 20,
//                   ),
//                 ),
//                 Expanded(
//                   child: ListView.builder(
//                     itemBuilder: (context, index) {
//                       return Card(
//                         child: ListTile(
//                           title: Text(
//                             subData.data![index].name.toString(),
//                           ),
//                           subtitle: Text(
//                             subData.data![index].pantoneValue.toString(),
//                           ),
//                         ),
//                       );
//                     },
//                     itemCount: subData.data!.length,
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:practice/subdata/subdata_services.dart';

class SubdataScreen extends StatefulWidget {
  const SubdataScreen({super.key});

  @override
  State<SubdataScreen> createState() => _SubdataScreenState();
}

class _SubdataScreenState extends State<SubdataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Subdata Example')),
      body: FutureBuilder(
          future: SubdataServices().getSubDataWithoutModel(),
          builder: (context, snapshot) {
            // Check if the snapshot has data and there's no error
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

            if (snapshot.hasData) {
              // Ensure snapshot.data is properly cast to a Map for easier access
              var data = snapshot.data as Map<String, dynamic>;

              // Safeguarding against missing keys or null values in nested structures
              var supportText =
                  data["support"]?["text"] ?? "No support text available";

              return Column(
                children: [
                  // Displaying the integer values as text
                  Text(
                    data["page"].toString(), // Convert integer to string
                    style: const TextStyle(
                      color: Colors.teal,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    data["total"].toString(), // Convert integer to string
                    style: const TextStyle(
                      color: Colors.teal,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    data["totalPages"].toString(), // Convert integer to string
                    style: const TextStyle(
                      color: Colors.teal,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    data["perPage"].toString(), // Convert integer to string
                    style: const TextStyle(
                      color: Colors.teal,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    supportText, // Nested field safely accessed
                    style: const TextStyle(
                      color: Colors.teal,
                      fontSize: 20,
                    ),
                  ),
                  // List of data items
                  Expanded(
                    child: ListView.builder(
                      itemCount: data["data"].length,
                      itemBuilder: (context, index) {
                        var item = data["data"][index];
                        return Card(
                          child: ListTile(
                            title: Text(
                              item["name"].toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              item["pantoneValue"].toString(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }

            // Fallback if no data is available
            return const Center(
              child: Text('No data available'),
            );
          }),
    );
  }
}
