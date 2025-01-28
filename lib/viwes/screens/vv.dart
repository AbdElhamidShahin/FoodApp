// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:food_app/model/cubit/bloc.dart';
// import 'package:food_app/model/cubit/states.dart';
//
// class MedicalScreen extends StatelessWidget {
//   final int? ItemCount;
//   final String tableName; // اسم الجدول في قاعدة البيانات
//   final Category? category;
//
//   const MedicalScreen(
//       {Key? key, this.ItemCount, required this.tableName, this.category})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             height: 50,
//             child: Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 12),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(30.0),
//                     child: Container(
//                       height: 40,
//                       width: screenWidth * 0.15,
//                       decoration: const BoxDecoration(color: Colors.black12),
//                       child: Center(
//                         child: BlocBuilder<FoodCubit, FoodState>(
//                           builder: (context, state) {
//                             if (state is CategoryLoaded) {
//                               final itemCount = state.categories.length;
//                               return Text(
//                                 '$itemCount', // Display item count
//                                 style: const TextStyle(
//                                   fontSize: 18,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               );
//                             } else {
//                               return const CircularProgressIndicator(
//                                 color: Colors.white,
//                               );
//                             }
//                           },
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const Spacer(),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                   child: Text(
//                     "صيداليات",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: screenWidth * 0.06,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           // ListView Section
//           Expanded(
//             child: BlocBuilder<FoodCubit, FoodState>(
//               builder: (context, state) {
//                 if (state is CategoryLoadingState) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (state is CategoryLoaded) {
//                   final categories = state.categories;
//
//                   return ListView.builder(
//                     itemCount: categories.length,
//                     itemBuilder: (context, index) {
//                       return GestureDetector(
//                         onTap: () {},
//                       );
//                     },
//                   );
//                 } else if (state is CategoryError) {
//                   return Center(
//                     child: Text('Error: ${state.message}'),
//                   );
//                 } else {
//                   return const Center(child: Text('No data available'));
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
