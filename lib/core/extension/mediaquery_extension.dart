import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  double dw({double percent = 1}) {
    var deviceWidth =  MediaQuery.of(this).size.width ;

    if (percent > 1 || percent <= 0) {
      throw Exception("percent must be between 0 and 1");
    }
    final size = deviceWidth * percent;
    // print(size);
    return size;
  }

  double dh({double percent = 1}) {
    var deviceHeight = MediaQuery.of(this).size.height;
    if (percent > 1 || percent <= 0) {
      throw Exception("percent must be between 0 and 1");
    }
    final size = deviceHeight * percent;
    // print(size);
    return size;
  }

  
}
