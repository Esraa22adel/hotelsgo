import 'package:flutter/material.dart';
import '/widgets/filteritem_widget.dart';
import '/widgets/sortitem_widget.dart';

class customButtonWidget extends StatelessWidget {
  const customButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                )),
                isScrollControlled: true,
                builder: (context) {
                  return FractionallySizedBox(
                    heightFactor: 0.9,
                    child: SortItemWidget(),
                  );
                });
          },
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(
                Colors.transparent), // Set transparent background color
            // Remove box shadow
          ),
          child: Row(
            children: [
              Icon(
                Icons.sort,
                color: Color(0xFFA3D3E4),
              ),
              SizedBox(width: 8),
              Text(
                'Sort',
                style: TextStyle(
                    color: Color.fromARGB(255, 114, 185, 211),
                    fontSize: 22,
                    fontWeight: FontWeight.w500 // Set text color
                    ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                isScrollControlled: true,
                builder: (context) {
                  return FractionallySizedBox(
                    heightFactor: 0.9,
                    child: FilterItemWidget(),
                  );
                });
          },
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(
                Colors.transparent), // Set transparent background color
            // Remove box shadow
          ),
          child: Row(
            children: [
              Icon(
                Icons.filter_list,
                color: Color.fromARGB(255, 114, 185, 211),
              ),
              SizedBox(width: 8),
              Text(
                'Filter',
                style: TextStyle(
                    color: Color(0xFFA3D3E4),
                    fontSize: 22,
                    fontWeight: FontWeight.w500 // Set text color
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
