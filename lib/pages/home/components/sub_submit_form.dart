import 'package:car_management_tools/pages/home/components/sub_items_availability_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/constants.dart';
import '../../../controllers/controllers.dart';
import '../../../widgets/rounded_button.dart';
import '../../bottom_navigation.dart';

class SubmitForm extends StatefulWidget {
  int index;

  SubmitForm({Key? key, required this.index}) : super(key: key);

  @override
  State<SubmitForm> createState() => _SubmitFormState();
}

class _SubmitFormState extends State<SubmitForm> {
  final InspectionController _inspectionController = Get.find<InspectionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: appBarBg,
        title: Text(
          'Hand Over Inspection Form',
          style: GoogleFonts.roboto(fontSize: 17, color: blackText),
        ),
        centerTitle: false,
        leading: InkWell(
          onTap: () {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const BottomNavigation()));
            });
          },
          child: const Icon(
            Icons.arrow_back,
            color: blackText,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            mediumVSpacer,
            Image.asset('assets/images/celebrate_illustration.png'),
            Center(
              child: Text(
                'Lorem ipsum dolor sit amet consectetur.\nEgestas rhoncus nisl vivamus condimentum.',
                style: GoogleFonts.rubik(
                  color: lightText,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            smallVSpacer,
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _progressBox(index: 0, isActive: _inspectionController.inspectionItems[0]['checked']),
                  _progressBox(index: 1, isActive: _inspectionController.inspectionItems[1]['checked']),
                  _progressBox(index: 2, isActive: _inspectionController.inspectionItems[2]['checked']),
                  _progressBox(index: 3, isActive: _inspectionController.inspectionItems[3]['checked']),
                  _progressBox(index: 4, isActive: _inspectionController.inspectionItems[4]['checked']),
                ],
              ),
            ),
            largeVSpacer,
            InkWell(
              onTap: () {
                _inspectionController.checkedIndex.value < _inspectionController.inspectionItems.length - 1
                    ? Get.off(
                        () => ItemsAvailabilityForm(index: widget.index),
                      )
                    : null;
              },
              child: Obx(() {
                return RoundedButton(
                  text:
                      _inspectionController.checkedIndex.value >= _inspectionController.inspectionItems.length - 1 ? 'Submit' : 'Go to next section',
                  icon: Icons.arrow_forward_ios,
                  width: 265.0,
                  color: primaryColor,
                  pretext: false,
                );
              }),
            ),
            largeVSpacer,
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300.0,
              decoration: const BoxDecoration(
                color: purple,
              ),
              child: Column(
                children: [
                  mediumVSpacer,
                  Center(
                    child: Text(
                      'Lorem ipsum dolor sit amet consectetur.\n Mauris morbi natoque sit leo. Lectus aenean non tempus feugiat consequat.\n Tristique a.',
                      style: GoogleFonts.rubik(
                        color: white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  mediumVSpacer,
                  InkWell(
                    onTap: () {
                      Get.off(
                        () => const BottomNavigation(),
                      );
                    },
                    child: RoundedButton(
                      text: 'Skip & continue later',
                      icon: Icons.arrow_forward_ios,
                      width: 265.0,
                      color: white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _progressBox({required int index, required bool isActive}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 35,
          width: 28,
          child: isActive
              ? Center(
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.done,
                      size: 15,
                      color: white,
                    ),
                  ),
                )
              : const SizedBox(),
        ),
        smallVSpacer,
        Container(
          height: 35,
          width: 28,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(color: isActive ? purple : lightBoxStroke, width: 3.0),
            color: isActive ? submitFill : white,
          ),
          child: Center(
            child: Text(
              (index + 1).toString(),
              style: GoogleFonts.rubik(color: isActive ? green : lightBoxStroke, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
