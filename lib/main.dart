import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gorouter/model/cat_model.dart';
import 'package:gorouter/route.dart';
import 'package:gorouter/services/api.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: MyRouter().router,
    );
  }
}

// FutureBuilder<List<CatFacts>> _buildBody(BuildContext context) {
//   final client = CatClient(Dio(BaseOptions(contentType: "application/json")));
//
//   return FutureBuilder <List<CatFacts>>(
//       future: client.CatFact(),
//       builder: (context, snapShot) {
//         if (snapShot.hasData)
//           {
//             final List<CatFacts> facts = snapShot.data!;
//             return _buildPosts(context, facts);
//           }
//         else{
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       }
//   );
// }

// ListView _buildPosts(BuildContext context, List<CatFacts> get) {
//   return ListView.builder(itemBuilder: (context, index) {
//     return Card(
//         elevation: 4,
//         child: ListTile(
//           title: Text(
//             get[index].fact,
//           ),
//           subtitle: Text(get[index].lenght.toString()),
//         )
//     );
//   });
// }