
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:timeee/services/my_service_firestore.dart';
import 'package:timeee/ui/general/colors.dart';

class ItemCategoryWidget extends StatelessWidget {

  String text;
  ItemCategoryWidget({required this.text,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.5),
      decoration: BoxDecoration(
          color: categoryColor[text],
          borderRadius: BorderRadius.circular(6.0)
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 13.0,
        ),
      ),
    );
  }
}