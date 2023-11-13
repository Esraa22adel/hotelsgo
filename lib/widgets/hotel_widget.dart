import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '/providers/hotel_provider.dart';
import 'package:provider/provider.dart';

class HotelWidget extends StatefulWidget {
  const HotelWidget({super.key});

  @override
  State<HotelWidget> createState() => _HotelWidgetState();
}

class _HotelWidgetState extends State<HotelWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityTween;

  @override
  void initState() {
    super.initState();
    // Fetch hotels when the widget is initialized
    Provider.of<HotelProvider>(context, listen: false).fetchHotels();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _opacityTween = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    // Start the animation
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HotelProvider>(builder: (context, hotelProvider, child) {
      if (hotelProvider.hotels.isEmpty) {
        // Loading indicator or empty state
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        // Display the list of hotels
        return ListView.builder(
          itemCount: hotelProvider.hotels.length,
          itemBuilder: (context, index) {
            final hotel = hotelProvider.hotels[index];
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  child: Column(
                    children: [
                      Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              AspectRatio(
                                aspectRatio: 2,
                                child: AnimatedBuilder(
                                    animation: _controller,
                                    builder: (context, child) {
                                      return Opacity(
                                        opacity: _opacityTween.value,
                                        child: Image.network(
                                          hotel.image as String,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    }),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 16, top: 8, bottom: 8),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            RatingBar(
                                              ratingWidget: RatingWidget(
                                                full: Icon(
                                                  Icons.star_rate_rounded,
                                                  color: Colors
                                                      .yellow, // Set the color to yellow
                                                ),
                                                half: Icon(
                                                  Icons.star_half_rounded,
                                                  color: Colors
                                                      .yellow, // Set the color to yellow
                                                ),
                                                empty: Icon(
                                                  Icons.star_border_rounded,
                                                  color: Colors
                                                      .yellow, // Set the color to yellow
                                                ),
                                              ),
                                              onRatingUpdate: (value) {},
                                              itemPadding: EdgeInsets.zero,
                                              initialRating: hotel
                                                  .stars, // Corrected property name from starts to stars
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemSize: 24,
                                            ),
                                            Text(
                                              hotel.name,
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 22),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  width: 30,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF045f05),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25), // Half of the height for a perfect circle
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      hotel.reviewScore
                                                          .toStringAsFixed(1),
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 4),
                                                Text(
                                                  hotel.review,
                                                  style: TextStyle(
                                                      color: Colors.grey
                                                          .withOpacity(0.8),
                                                      fontSize: 14),
                                                ),
                                                const SizedBox(width: 4),
                                                Icon(
                                                  Icons.location_on,
                                                  size: 16,
                                                ),
                                                Expanded(
                                                    child: Text(
                                                  hotel.address,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey
                                                          .withOpacity(0.8)),
                                                ))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16, top: 8, bottom: 8, right: 16),
                                    child: Container(
                                      height: 108,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color(0xFFd9d9d9),
                                          width:
                                              2, // Set the width of the border as needed
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            8), // Set border radius as needed
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: <Widget>[
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 100,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFBEDDE5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8), // Half of the height for a perfect circle
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "our lowest price",
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF556C75),
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '\$${hotel.price}',
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: const TextStyle(
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              Color(0xFF045f05),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Rencany',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.grey
                                                              .withOpacity(0.8),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(width: 4),
                                            Expanded(
                                              child: Text(
                                                "view Deal >",
                                                textAlign: TextAlign.right,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 22),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "More peices",
                                      textAlign: TextAlign.right,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w200,
                                        fontSize: 18,
                                        color: Colors.black54,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                              top: 8,
                              right: 8,
                              child: Material(
                                color: Colors.transparent,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                  ),
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }
    });
  }
}
