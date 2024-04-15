import 'package:flutter/material.dart';
import 'package:image_gallery/screens/image_details.dart';
import 'package:image_gallery/screens/image_list.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Gallery',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ImageListScreen(),
      routes: {
        "/image-details": (context) => const ImageDetailsScreen(),
        "/image-list": (context) => const ImageListScreen(),
      },
    );
  }
}
