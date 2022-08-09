import 'package:flutter/material.dart';

class categories_chip extends StatelessWidget {
  const categories_chip({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          Row(
            children: const [
              SizedBox(width: 10),
              Chip(label: Text('Design')),
              SizedBox(width: 10),
              Chip(label: Text('Development')),
              SizedBox(width: 10),
              Chip(label: Text('Finance & Accounting')),
              SizedBox(width: 10),
              Chip(label: Text('Marketing')),
              SizedBox(width: 10),
              Chip(label: Text('Lifestyle')),
              SizedBox(width: 10),
            ],
          ),
          Row(
            children: const [
              Chip(label: Text('It & Software')),
              SizedBox(width: 10),
              Chip(label: Text('Business')),
              SizedBox(width: 10),
              Chip(label: Text('Office Productivity')),
              SizedBox(width: 10),
              Chip(label: Text('Personal Development')),
              SizedBox(width: 10),
            ],
          )
        ],
      ),
    );
  }
}
