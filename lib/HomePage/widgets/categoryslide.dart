// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class CategoryModel {
  final String name;
  final IconData icon;
  bool isSelected;

  CategoryModel({required this.name, required this.icon, this.isSelected = false});
}

class CategroySlide extends StatefulWidget {
  const CategroySlide({super.key});

  @override
  _CategroySlideState createState() => _CategroySlideState();
}

class _CategroySlideState extends State<CategroySlide> {
  List<CategoryModel> categoryData = [
    CategoryModel(name: "School", icon: Icons.school_rounded),
    CategoryModel(name: "Work", icon: Icons.work_rounded),
    CategoryModel(name: "Personal", icon: Icons.person_2_rounded),
    CategoryModel(name: "Health", icon: Icons.healing_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Center(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryData.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              setState(() {
                categoryData[index].isSelected = !categoryData[index].isSelected;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 6, bottom: 8, top: 8, left:6),
              child: Material(
                elevation: 3,
                borderRadius: BorderRadius.circular(10),
                color: categoryData[index].isSelected ? const Color.fromARGB(255, 71, 115, 180) : Colors.white,
                child: Container(
                  height: MediaQuery.sizeOf(context).height*0.111,
                  width: MediaQuery.sizeOf(context).width*0.183,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(categoryData[index].icon, color: categoryData[index].isSelected ? Colors.white : const Color.fromARGB(255, 39, 64, 101)),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        categoryData[index].name,
                        style: TextStyle(
                          fontSize: MediaQuery.sizeOf(context).height*0.018,
                          color: categoryData[index].isSelected ? Colors.white : const Color.fromARGB(255, 39, 64, 101),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
