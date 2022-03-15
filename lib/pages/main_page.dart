import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movieapp/models/album.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Album? myData;

  // loadApi() async {
  //   var uri = Uri.parse('https://jsonplaceholder.typicode.com/albums/1');
  //   var response = await http.get(uri);
  //   var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  //   userId = decodedResponse['userId'];
  //   id = decodedResponse['id'];
  //   title = decodedResponse['title'];
  //   setState(() {});
  // }

  Future<Album> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Album');
    }
  }

  @override
  void initState() {
    // TODO: implement initStat
    super.initState();
    fetchAlbum().then((value) {
      setState(() {
        myData = value;
        print(myData!.toJson()); 
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie app')),
      body: Center(
        child: myData == null
            ? (const Center(child: Text('Loading...')))
            : Column(
                children: [
                  Text('${myData!.id}'),
                  Text('${myData!.title}'),
                ],
              ),
      ),
    );
  }
}


// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import '../models/album.dart';

// class MainPage extends StatefulWidget {
//   const MainPage({Key? key}) : super(key: key);

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   Album? myData;

//   Future<Album> fetchAlbum() async {
//     final response = await http
//         .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

//     if (response.statusCode == 200) {
//       return Album.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to load album');
//     }
//   }
//   // loadApi() async {
//   //   var uri = Uri.parse('https://jsonplaceholder.typicode.com/albums/1');
//   //   var response = await http.get(uri);
//   //   var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
//   //   userId = decodedResponse['userId'];
//   //   id = decodedResponse['id'];
//   //   title = decodedResponse['title'];
//   //   setState(() {

//   //   });

//   // }

//   @override
//   void initState() {
//     fetchAlbum().then((value) {
//       setState(() {
//         myData = value;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: const Text('Movie App')),
//         body: myData == null
//             ? const Text('Loading...')
//             : Column(
//                 children: [
//                   Text('${myData!.id}'),
//                   Text('${myData!.title}'),
//                 ],
//               ));
//   }
// }
