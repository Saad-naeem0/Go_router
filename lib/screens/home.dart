import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gorouter/model/cat_model.dart';

import '../services/api.dart';

//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// int selectedIndex = 0;
//
//   CatFacts catFacts = CatFacts();
// void getHttp() async {
//   try {
//     var response = await Dio().get(baseUrl);
//     print(response);
//   } catch (e) {
//     print(e);
//   }
// }
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Center(child: Text('HomePage')),
//           ListView.builder(
//               itemCount: ,
//               itemBuilder: (BuildContext context, int index) {
//             return ListView(children: [
//               Text('${response.data.toString()}')
//             ],);
//           }),
//           ElevatedButton(onPressed: () {
//             GoRouter.of(context).push('/search');
//           }, child: Text("Search Page")),
//           // NavBar(),
//         ],
//       ),
//     );
//   }
// }
//
//
//

// final client = Dio();
//
// Future<CatFacts?> getData() async {
//   final baseurl = 'https://catfact.ninja/';
//   final url = "fact";
//
//   try {
//     final response = await client.get(baseurl+url);
//     if (response.statusCode == 200) {
//       print(response.statusCode);
//       print(response.data);
//       return CatFacts.fromJson(response.data);
//     } else {
//       print('${response.statusCode} : ${response.data.toString()}');
//       throw response.statusCode.toString();
//     }
//   } catch (error) {
//     print(error);
//   }
// }
FutureBuilder <CatFacts> HomePage(BuildContext context)  {
  final client = CatClient(Dio(BaseOptions(contentType: "application/json")));

  return FutureBuilder<CatFacts>(
      future: client.CatFact(),
      builder: (context, snapShot) {
        if (snapShot.connectionState == ConnectionState.done) {
          if (snapShot.hasData) {
            CatFacts facts = snapShot.data!;
            return _buildTile(context, facts);
          } else {
            return Center(
              child: Text("NULL"),
            );
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      });
}

TextEditingController fact = TextEditingController();
TextEditingController length = TextEditingController();

FlutterSecureStorage secureStorage = FlutterSecureStorage();

Future<void> Save(String key, String value) async {
  await secureStorage.write(key: key, value: value);
}

Future<String> GetValue(String key) async {
  return await secureStorage.read(key: key) ?? "";
}

void saveDetails(){
  Save("fact", fact.text);
  Save("length", length.text);
}

Widget _buildTile(BuildContext context, CatFacts get) {
    return Scaffold(
      body: MaterialApp(
        home: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("CatFacts", style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 40,
              color: Colors.blueAccent
            ),),
            Card(
                elevation: 4,
                child: ListTile(
                  title: Text(
                    get.fact,
                  ),
                  subtitle: Text(get.length.toString()),
                  trailing: IconButton(
                    icon: Icon(Icons.save, color: Colors.blueAccent,),
                    onPressed: () {
                    fact.text = get.fact;
                    length.text = get.length.toString();
                    saveDetails();
                    },
                  ),
                )
            ),
            // ElevatedButton(onPressed: (){
            //   context.go('/');
            // }, child: const Text("New-Fact"))
          ],
        ),
      ),
    );

}
