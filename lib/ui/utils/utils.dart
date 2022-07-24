import 'package:flutter/material.dart';

class Utils {
   double deviceHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

   double deviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
