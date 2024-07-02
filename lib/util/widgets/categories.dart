import 'package:flutter/material.dart';
import 'package:shopz/util/constants/color_constants.dart';

class Categories extends StatefulWidget {
  final Function(String) onSelected;

  const Categories({super.key, required this.onSelected});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = [
    "All",
    "T-shirt",
    "Women",
    "Hoodies & Sweaters",
    "Jacket",
    "Men"
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 30,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          widget.onSelected(categories[index]);
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index
                    ? ColorConstants.blackColor
                    : ColorConstants.black50,
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.only(top: 5),
              height: 2,
              width: 30,
              color: selectedIndex == index
                  ? ColorConstants.blackColor
                  : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
