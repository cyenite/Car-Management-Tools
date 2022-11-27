import 'package:car_management_tools/controllers/controllers.dart';
import 'package:car_management_tools/helpers/asset_mapper.dart';
import 'package:car_management_tools/pages/home/components/sub_submit_form.dart';
import 'package:car_management_tools/pages/pages.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../constants/constants.dart';
import '../../../widgets/rounded_button.dart';

class ItemsAvailabilityForm extends StatefulWidget {
  int index;
  ItemsAvailabilityForm({Key? key, required this.index}) : super(key: key);

  @override
  State<ItemsAvailabilityForm> createState() => _ItemsAvailabilityFormState();
}

class _ItemsAvailabilityFormState extends State<ItemsAvailabilityForm> {
  final InspectionController _inspectionController = Get.find<InspectionController>();
  bool? itemAvailable;
  double _stepSliderValue = 3.0;
  String _currentFunctionality = 'Average functionality';

  _gradeFunctionality(double sliderValue) {
    sliderValue > 4.0
        ? _currentFunctionality = 'Great functionality'
        : sliderValue < 2.0
            ? _currentFunctionality = 'Poor functionality'
            : _currentFunctionality = 'Average functionality';
  }

  _loadNextItem(int index) {
    setState(() {
      _inspectionController.checkedIndex.value = index + 1;
      _inspectionController.inspectionItems[widget.index]['functionality'] = _stepSliderValue;
      _inspectionController.inspectionItems[widget.index]['available'] = itemAvailable;
      _inspectionController.inspectionItems[widget.index]['checked'] = true;
      widget.index = index + 1;
      _stepSliderValue = _inspectionController.inspectionItems[widget.index]['functionality'];
      itemAvailable = _inspectionController.inspectionItems[widget.index]['available'];
      _gradeFunctionality(3.0);
    });
    Get.to(
      () => SubmitForm(index: widget.index),
    );
  }

  _loadPreviousItem(int index) {
    setState(() {
      _inspectionController.inspectionItems[widget.index]['functionality'] = _stepSliderValue;
      _inspectionController.inspectionItems[widget.index]['available'] = itemAvailable;
      _inspectionController.inspectionItems[widget.index]['checked'] = true;
      widget.index = index - 1;
      _stepSliderValue = _inspectionController.inspectionItems[widget.index]['functionality'];
      itemAvailable = _inspectionController.inspectionItems[widget.index]['available'];
      _gradeFunctionality(3.0);
    });
  }

  @override
  void initState() {
    _gradeFunctionality(_inspectionController.inspectionItems[widget.index]['functionality']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: appBarBg,
        title: Text(
          'Simple Form > Items availability',
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
      body: Column(
        children: [
          mediumVSpacer,
          Center(
            child: Text(
              'Items availability & Functionality',
              style: GoogleFonts.rubik(),
            ),
          ),
          Center(
            child: DotsIndicator(
              position: double.parse(widget.index.toString()),
              dotsCount: _inspectionController.inspectionItems.length,
              decorator: DotsDecorator(
                color: Colors.grey.shade300,
                size: const Size(18.0, 18.0),
                activeSize: const Size(18.0, 18.0),
                activeColor: green,
              ),
            ),
          ),
          mediumVSpacer,
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              color: formBg,
              border: Border.all(color: blackText),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(23.0),
                bottomRight: Radius.circular(23.0),
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: 37.0,
                  decoration: const BoxDecoration(
                    color: formTopBg,
                    border: Border(
                      bottom: BorderSide(color: blackText),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 8.0),
                        height: 26,
                        width: 26,
                        decoration: BoxDecoration(
                          color: const Color(0xff3B3B3B),
                          borderRadius: BorderRadius.circular(2.2),
                        ),
                        child: Center(
                          child: Text(
                            widget.index.toString(),
                            style: GoogleFonts.rubik(color: white),
                          ),
                        ),
                      ),
                      smallHSpacer,
                      Text(
                        _inspectionController.inspectionItems[widget.index]['name'],
                        style: GoogleFonts.rubik(color: const Color(0xff3B3B3B), fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 114.0,
                  child: simpleFormAssetMapper(index: widget.index),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Is it available?',
                        style: GoogleFonts.rubik(color: lightText),
                      ),
                    ],
                  ),
                ),
                smallVSpacer,
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Yes',
                        style: GoogleFonts.rubik(color: blackText, fontWeight: FontWeight.w500),
                      ),
                      Radio(
                        value: true,
                        fillColor: MaterialStateProperty.all(green),
                        groupValue: itemAvailable,
                        onChanged: (bool? value) {
                          setState(() {
                            itemAvailable = value;
                          });
                        },
                      ),
                      smallHSpacer,
                      Text(
                        'No',
                        style: GoogleFonts.rubik(color: blackText, fontWeight: FontWeight.w500),
                      ),
                      Radio(
                        value: false,
                        fillColor: MaterialStateProperty.all(green),
                        groupValue: itemAvailable,
                        onChanged: (bool? value) {
                          setState(() {
                            itemAvailable = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                smallVSpacer,
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 26,
                  decoration: BoxDecoration(
                    color: white,
                    border: Border.all(color: lightBoxStroke),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Center(
                    child: Text(
                      _currentFunctionality,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: green,
                      ),
                    ),
                  ),
                ),
                smallVSpacer,
                SfSlider(
                    showLabels: true,
                    interval: 1,
                    min: 1,
                    max: 5,
                    stepSize: 1,
                    //thumbIcon: _thumbView(),
                    value: _stepSliderValue,
                    activeColor: green,
                    inactiveColor: blue,
                    thumbShape: const SfThumbShape(),
                    onChanged: (dynamic values) {
                      setState(() {
                        _stepSliderValue = values as double;
                        _gradeFunctionality(_stepSliderValue);
                      });
                    },
                    enableTooltip: true),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Very poor\nfunctionality',
                        style: GoogleFonts.inter(),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        'Great\nfunctionality',
                        style: GoogleFonts.inter(),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          smallVSpacer,
          smallVSpacer,
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    itemAvailable != null && widget.index > 0 ? _loadPreviousItem(widget.index) : null;
                  },
                  child: RoundedButton(
                    text: 'Back',
                    icon: Icons.arrow_back_ios,
                    width: 135.0,
                    color: itemAvailable != null && widget.index > 0 ? primaryColor : roundButtonsDarkBg,
                    pretext: true,
                  ),
                ),
                InkWell(
                  onTap: () {
                    itemAvailable != null && widget.index < _inspectionController.inspectionItems.length - 1 ? _loadNextItem(widget.index) : null;
                  },
                  child: RoundedButton(
                    text: 'Next',
                    icon: Icons.arrow_forward_ios,
                    width: 135.0,
                    color:
                        itemAvailable != null && widget.index < _inspectionController.inspectionItems.length - 1 ? primaryColor : roundButtonsDarkBg,
                    pretext: false,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///TODO: Replace slider thumb with custom vector/asset
  Widget _thumbView() {
    return Image.asset(
      'assets/images/slider_vector.png',
      width: 31.0,
      height: 23.0,
    );
  }
}
