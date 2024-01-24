// import 'package:flutter/material.dart';

// import 'detail_screen.dart';

// class CustomSearchDelegate extends SearchDelegate<String> {
//   final List<String> items = [
//     'Apple',
//     'Banana',
//     'Orange',
//     'Mango',
//     'Strawberry',
//     'Blueberry',
//     'Cherry',
//     'Pineapple',
//     'Watermelon',
//   ];

//   List<String> searchAndFilter(String query) {
//     if (query == '') return [];

//     return items
//         .where((item) => item.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: const Icon(Icons.arrow_back, color: Colors.blue),
//       onPressed: () {
//         close(context, '');
//       },
//     );
//   }

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: const Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final results = searchAndFilter(query);

//     return ListView.builder(
//       itemCount: results.length,
//       itemBuilder: (context, index) {
//         final item = results[index];
//         return ListTile(
//           title: Text(item),
//           onTap: () {
//             query = item;
//             showResults(context);
//           },
//         );
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     final results = searchAndFilter(query);

//     return ListView.builder(
//       itemCount: results.length,
//       itemBuilder: (context, index) {
//         final item = results[index];
//         return ListTile(
//           title: Text(item),
//           onTap: () {
//             Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (_) => DetailScreen(
//                   fruitName: item,
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
