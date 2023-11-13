import 'package:flutter/material.dart';

class FilterItemWidget extends StatefulWidget {
  const FilterItemWidget({Key? key}) : super(key: key);

  @override
  State<FilterItemWidget> createState() => _FilterItemWidgetState();
}

class _FilterItemWidgetState extends State<FilterItemWidget> {
  double _value = 20;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // "Rest" text on the left
                Text(
                  'Rest',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    decoration: TextDecoration.underline,
                  ),
                ),
                // Centered "Filters" text
                Expanded(
                  child: Center(
                    child: Text(
                      'Filters',
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
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'PRICE PER NIGHT',
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.all(
                      Radius.circular(4.0)), // Adjust the radius as needed
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\$${_value.round()}',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Center(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 20,
                      ),
                      overlayColor: Colors.white.withOpacity(0.4),
                    ),
                    child: Slider(
                      value: _value,
                      min: 20,
                      max: 540,
                      thumbColor: Colors.white,
                      divisions: 100,
                      onChanged: (double value) {
                        setState(() {
                          _value = value;
                        });
                      },
                      label: '\$${_value.round().toString()}',
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$20',
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '\$540\+',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                'RATING',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomContainerRating(color: Color(0xFFdb3734), text: '0+'),
              CustomContainerRating(color: Color(0xFFfc9e15), text: '7+'),
              CustomContainerRating(color: Color(0xFF62a30f), text: '7.5+'),
              CustomContainerRating(color: Color(0xFF028000), text: '8+'),
              CustomContainerRating(color: Color(0xFF004e00), text: '8.5+'),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                'HOTEL CLASS',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Image.asset(
              'assets/1.PNG',
            ),
            Image.asset('assets/2.PNG'),
            Image.asset('assets/3.PNG'),
            Image.asset('assets/4.PNG'),
            Image.asset('assets/5.PNG'),
          ]),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                'DISTANCE FROM',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFFededee),
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Location',
                    style: TextStyle(fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'City center >',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center the button horizontally
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Show Result',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor:
                        Colors.blue, // You can change the button color
                    padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10), // Adjust horizontal padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomContainerRating extends StatelessWidget {
  final Color color;
  final String text;

  const CustomContainerRating({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0, // Adjust width as needed
      height: 40.0, // Adjust height as needed
      color: color,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
