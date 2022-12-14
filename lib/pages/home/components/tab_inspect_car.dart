import 'package:car_management_tools/constants/constants.dart';
import 'package:car_management_tools/controllers/controllers.dart';
import 'package:car_management_tools/pages/home/components/sub_items_availability_form.dart';
import 'package:car_management_tools/pages/home/components/sub_submit_form.dart';
import 'package:car_management_tools/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

class InspectCar extends StatefulWidget {
  const InspectCar({Key? key}) : super(key: key);

  @override
  State<InspectCar> createState() => _InspectCarState();
}

class _InspectCarState extends State<InspectCar> {
  final InspectionController _inspectionController = Get.find<InspectionController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            mediumVSpacer,
            Text(
              'It takes ${_inspectionController.inspectionItems.length} steps and less than 2 minutes\n to inspect your car.',
              style: GoogleFonts.rubik(color: lightText, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            mediumVSpacer,
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _inspectionController.inspectionItems.length,
                  itemBuilder: (c, i) {
                    return Obx(() {
                      return inspectionListItem(
                          item: _inspectionController.inspectionItems[i]['name'],
                          index: i,
                          length: _inspectionController.inspectionItems.length,
                          isChecked: _inspectionController.inspectionItems[i]['checked']);
                    });
                  }),
            ),
            mediumVSpacer,
            InkWell(
              onTap: () {
                _inspectionController.checkedIndex.value < _inspectionController.inspectionItems.length - 1
                    ? Get.off(
                        () => ItemsAvailabilityForm(index: _inspectionController.checkedIndex.value),
                      )
                    : Get.off(
                        () => SubmitForm(index: _inspectionController.checkedIndex.value),
                      );
              },
              child: Obx(() {
                return RoundedButton(
                  text: _inspectionController.checkedIndex.value != 0 ? 'Let\'s continue where we left' : 'Let\'s begin inspecting',
                  icon: Icons.arrow_forward_ios,
                  width: MediaQuery.of(context).size.width * 0.7,
                  color: primaryColor,
                  pretext: false,
                );
              }),
            ),
            largeVSpacer,
          ],
        ),
      ),
    );
  }

  Widget inspectionListItem({required String item, required int index, required int length, required bool isChecked}) {
    return TimelineTile(
      alignment: TimelineAlign.start,
      isFirst: index == 0,
      isLast: index == length - 1,
      lineXY: 50.0,
      beforeLineStyle: LineStyle(color: isChecked ? green : lightBoxStroke, thickness: 1),
      afterLineStyle: LineStyle(color: isChecked ? green : lightBoxStroke, thickness: 1),
      indicatorStyle: IndicatorStyle(
        width: 30,
        height: 30,
        color: green,
        indicator: Container(
          decoration: BoxDecoration(
            border: Border.all(color: isChecked ? green : lightBoxStroke),
            color: isChecked ? green : white,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Center(
            child: Text(
              '${index + 1}',
              style: GoogleFonts.rubik(fontSize: 16, color: isChecked ? white : lightBoxStroke),
            ),
          ),
        ),
      ),
      endChild: SizedBox(
        height: 70.0,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
              child: Divider(
                color: isChecked ? green : lightBoxStroke,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 30.0,
              decoration: BoxDecoration(
                color: isChecked ? green : lightBoxFill,
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: lightBoxStroke),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20.0),
                    child: Center(
                      child: Text(
                        item,
                        style: GoogleFonts.rubik(color: isChecked ? white : lightText),
                      ),
                    ),
                  ),
                  isChecked
                      ? Container(
                          margin: const EdgeInsets.only(right: 20.0),
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.done,
                            size: 15,
                            color: green,
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
