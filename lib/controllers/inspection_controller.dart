import 'package:get/get.dart';

class InspectionController extends GetxController {
  RxList<Map<String, dynamic>> inspectionItems = <Map<String, dynamic>>[
    {
      "name": "Jack",
      "checked": false,
      "available": true,
      "functionality": 3.0,
    },
    {
      "name": "Spare Wheel",
      "checked": false,
      "available": true,
      "functionality": 3.0,
    },
    {
      "name": "Car Radio",
      "checked": false,
      "available": true,
      "functionality": 3.0,
    },
    {
      "name": "Headlights",
      "checked": false,
      "available": true,
      "functionality": 3.0,
    },
    {
      "name": "Submit",
      "checked": false,
      "available": true,
      "functionality": 3.0,
    },
  ].obs;

  RxInt checkedIndex = 0.obs;
}
