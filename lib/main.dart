import 'package:flutter/material.dart';
import '/providers/hotel_provider.dart';
import '/screens/hotel_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => HotelProvider(),
        child: HotelScreen(),
      ),
    );
  }
}
