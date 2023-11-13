import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hotel/providers/hotel_provider.dart';
import 'package:hotel/widgets/custombuttons_widget.dart';
import 'package:hotel/widgets/hotel_widget.dart';
import 'package:provider/provider.dart';

class HotelScreen extends StatefulWidget {
  @override
  _HotelScreenState createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch hotels when the widget is initialized
    Provider.of<HotelProvider>(context, listen: false).fetchHotels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white, // Set the background color to white
          elevation: 0, // Remove the shadow
          actions: [
            Expanded(
              // Use Expanded to make the action take full width
              child: customButtonWidget(),
            ),
          ],
        ),
        backgroundColor: Color(0xFFF1F1F1),
        body: HotelWidget());
  }
}
