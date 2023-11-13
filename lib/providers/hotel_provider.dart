import 'dart:convert';

import 'package:flutter/material.dart';
import '/models/hotel_model.dart';
import 'package:http/http.dart' as http;

class HotelProvider extends ChangeNotifier {
  List<HotelModel> _hotels = [];

  List<HotelModel> get hotels => _hotels;

  Future<void> fetchHotels() async {
    final response =
        await http.get(Uri.parse('https://www.hotelsgo.co/test/hotels'));
    print("qqqqqqqqq");
    print(response);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      _hotels = data.map((json) => HotelModel.fromJson(json)).toList();
      print("eeeeee");
      print(_hotels);
      print(_hotels.length);

      notifyListeners();
    } else {
      throw Exception('Failed to load hotels');
    }
  }
}
