import 'package:flutter/material.dart';

class SortItemWidget extends StatelessWidget {
  final List<String> recommendations = [
    'Our recommendation',
    'Rating & Recommended',
    'Price & Recommended',
    'Distance & Recommended',
    'Rating only',
    'Price only',
    'Distance only'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black87,
                width: 1.0,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Centered text
              Expanded(
                child: Center(
                  child: Text(
                    'Sort by',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              // Icon on the right
              IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        // List of recommendations with dividers
        ListView.builder(
          shrinkWrap: true,
          itemCount: recommendations.length,
          itemBuilder: (context, index) {
            final recommendation = recommendations[index];
            return Column(
              children: [
                ListTile(
                  title: Text(recommendation),
                ),
                Divider(
                  height: 1,
                  color: Colors.grey,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
