import 'package:get/get.dart';

class InspectionController extends GetxController {
  RxList<Map<String, dynamic>> inspectionItems = <Map<String, dynamic>>[
    {"name": "Jack", "checked": false},
    {"name": "Spare Wheel", "checked": false},
    {"name": "Car Radio", "checked": false},
    {"name": "Headlights", "checked": false},
    {"name": "Submit", "checked": false},
  ].obs;
}
