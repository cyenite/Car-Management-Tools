import 'package:flutter/cupertino.dart';

Widget simpleFormAssetMapper({required int index}) {
  switch (index) {
    case 0:
      return Image.asset('assets/images/jack.png');
    case 1:
      return Image.asset('assets/images/spare_wheel.png');
    case 2:
      return Image.asset('assets/images/car_radio.png');
    case 3:
      return Image.asset('assets/images/headlight.png');
    default:
      return Image.asset('assets/images/jack.png');
  }
}
