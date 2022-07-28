//  import 'package:flutter/material.dart';
 
 
//  Future<List<Post>> search(String search) async {
//     // ignore: avoid_print
//     print(search);
//     await Future.delayed(const Duration(seconds: 2));

//     List<Post> posts = [];
//     List name = [
//       "Aaronsburg, PA",
//       "Abanda, AL",
//       "Abbeville, LA",
//       "Abbeville, SC",
//       "Abbeville, GA",
//       "Abbeville, AL",
//       "Abbeville, MS",
//       "Abbotsford, WI",
//       "Abbott, TX",
//       "Abbottstown, PA",
//       "Abbyville, KS",
//       "Abercrombie, ND",
//       "Aberdeen, WA",
//       "Aberdeen, SD",
//       "Aberdeen, MD",
//       "Aberdeen, NC",
//       "Aberdeen, MS",
//       "Aberdeen, ID",
//       "Aberdeen, OH",
//       "Aberdeen, IN",
//       "Aberdeen Gardens, WA",
//       "Aberdeen Proving Ground, MD",
//     ];

//     for (int i = 0; i < name.length; i++) {
//       if (name[i].startsWith(search)) {
//         posts.add(Post(name[i]));
//       }
//     }

//     return posts;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: SearchBar<Post>(
//               minimumChars: 0,
//               onSearch: search,
//               onItemFound: (Post post, int index) {
//                 return ListTile(
//                   title: Text(post.title),
//                   // subtitle: Text(post.description),
//                 );
//               }),
//         ),
//       ),
//     );
//   }


// class Post {
//   final String title;
  

//   Post(this.title);
  
// }
