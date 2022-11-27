import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/constants.dart';
import '../../../widgets/rounded_button.dart';
import '../../bottom_navigation.dart';

class AcceptTerms extends StatefulWidget {
  const AcceptTerms({Key? key}) : super(key: key);

  @override
  State<AcceptTerms> createState() => _AcceptTermsState();
}

class _AcceptTermsState extends State<AcceptTerms> {
  final ScrollController _scrollController = ScrollController();
  bool _maxExtent = false;
  bool _termsAccepted = false;

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent && !_scrollController.position.outOfRange) {
      setState(() {
        _maxExtent = true;
      });
    }
    if (_scrollController.offset <= _scrollController.position.minScrollExtent && !_scrollController.position.outOfRange) {
      setState(() {
        _maxExtent = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: appBarBg,
        title: Text(
          'Accept terms',
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
            Center(
              child: RichText(
                overflow: TextOverflow.clip,
                textAlign: TextAlign.end,
                textDirection: TextDirection.rtl,
                softWrap: true,
                maxLines: 1,
                textScaleFactor: 1,
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Step 1:',
                      style: GoogleFonts.rubik(
                        color: purple,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: ' Terms of the agreement',
                      style: GoogleFonts.rubik(color: blackText, fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            smallVSpacer,
            Text(
              'You must accept the terms of “Partner-Fleet Manager Agreement” provided by the selected fleet manager. This agreement shall be binding for both of you.',
              style: GoogleFonts.rubik(color: lightText, fontWeight: FontWeight.w400, fontSize: 15.0),
              textAlign: TextAlign.center,
            ),
            smallVSpacer,
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: formBg,
                border: Border.all(color: blackText),
                borderRadius: const BorderRadius.all(
                  Radius.circular(23.0),
                ),
              ),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.5 - 50,
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          scrollDirection: Axis.vertical,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  'Partner-Fleet Manager Agreement',
                                  style: GoogleFonts.rubik(color: blue, fontWeight: FontWeight.w400, fontSize: 15.0),
                                  textAlign: TextAlign.center,
                                ),
                                smallVSpacer,
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Et sagittis, maecenas morbi lorem eu mauris, tincidunt donec. Nulla sem arcu sed aenean. Lectus vel interdum ullamcorper a mi viverra. Id blandit enim quam viverra id. Euismod quis eget in faucibus. Consequat sodales vivamus feugiat laoreet ante.',
                                  style: GoogleFonts.roboto(color: lightBoxStroke, fontWeight: FontWeight.w400, fontSize: 13.0),
                                  textAlign: TextAlign.justify,
                                ),
                                smallVSpacer,
                                Text(
                                  'Consequat sodales vivamus feugiat laoreet ante.',
                                  style: GoogleFonts.rubik(color: blackText, fontWeight: FontWeight.w400, fontSize: 13.0),
                                  textAlign: TextAlign.center,
                                ),
                                smallVSpacer,
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Et sagittis, maecenas morbi lorem eu mauris, tincidunt donec. Nulla sem arcu sed aenean. Lectus vel interdum ullamcorper a mi viverra. Id blandit enim quam viverra id. Euismod quis eget in faucibus. Consequat sodales vivamus feugiat laoreet ante.',
                                  style: GoogleFonts.roboto(color: lightBoxStroke, fontWeight: FontWeight.w400, fontSize: 13.0),
                                  textAlign: TextAlign.justify,
                                ),
                                smallVSpacer,
                                Text(
                                  'Consequat sodales vivamus feugiat laoreet ante.',
                                  style: GoogleFonts.rubik(color: blackText, fontWeight: FontWeight.w400, fontSize: 13.0),
                                  textAlign: TextAlign.center,
                                ),
                                smallVSpacer,
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Et sagittis, maecenas morbi lorem eu mauris, tincidunt donec. Nulla sem arcu sed aenean. Lectus vel interdum ullamcorper a mi viverra. Id blandit enim quam viverra id. Euismod quis eget in faucibus. Consequat sodales vivamus feugiat laoreet ante.',
                                  style: GoogleFonts.roboto(color: lightBoxStroke, fontWeight: FontWeight.w400, fontSize: 13.0),
                                  textAlign: TextAlign.justify,
                                ),
                                smallVSpacer,
                                Text(
                                  'Consequat sodales vivamus feugiat laoreet ante.',
                                  style: GoogleFonts.rubik(color: blackText, fontWeight: FontWeight.w400, fontSize: 13.0),
                                  textAlign: TextAlign.center,
                                ),
                                smallVSpacer,
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Et sagittis, maecenas morbi lorem eu mauris, tincidunt donec. Nulla sem arcu sed aenean. Lectus vel interdum ullamcorper a mi viverra. Id blandit enim quam viverra id. Euismod quis eget in faucibus. Consequat sodales vivamus feugiat laoreet ante.',
                                  style: GoogleFonts.roboto(color: lightBoxStroke, fontWeight: FontWeight.w400, fontSize: 13.0),
                                  textAlign: TextAlign.justify,
                                ),
                                smallVSpacer,
                                Text(
                                  'Consequat sodales vivamus feugiat laoreet ante.',
                                  style: GoogleFonts.rubik(color: blackText, fontWeight: FontWeight.w400, fontSize: 13.0),
                                  textAlign: TextAlign.center,
                                ),
                                smallVSpacer,
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Et sagittis, maecenas morbi lorem eu mauris, tincidunt donec. Nulla sem arcu sed aenean. Lectus vel interdum ullamcorper a mi viverra. Id blandit enim quam viverra id. Euismod quis eget in faucibus. Consequat sodales vivamus feugiat laoreet ante.',
                                  style: GoogleFonts.roboto(color: lightBoxStroke, fontWeight: FontWeight.w400, fontSize: 13.0),
                                  textAlign: TextAlign.justify,
                                ),
                                mediumVSpacer,
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.7,
                                  height: 130,
                                  decoration: BoxDecoration(
                                    color: termsBeigeBg,
                                    borderRadius: BorderRadius.circular(28.0),
                                    border: Border.all(color: blue, width: 0.3),
                                  ),
                                  child: Column(
                                    children: [
                                      smallVSpacer,
                                      smallVSpacer,
                                      Center(
                                        child: Text(
                                          'You have seen the Partner-Fleet Manager Agreement. Agree by tapping the checkbox',
                                          style: GoogleFonts.roboto(color: green, fontSize: 13.0),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      smallVSpacer,
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Checkbox(
                                            activeColor: green,
                                            value: _termsAccepted,
                                            onChanged: (value) {
                                              setState(() {
                                                _termsAccepted = value!;
                                              });
                                            },
                                          ),
                                          Text(
                                            'I agree to the terms',
                                            style: GoogleFonts.roboto(color: blackText, fontSize: 16.0, fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 40.0,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          color: _maxExtent ? termsGreenBg : termsRedBg,
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(23.0),
                            bottomLeft: Radius.circular(23.0),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            _maxExtent
                                ? 'Thank you for reading Partner-Fleet Manager Agreement'
                                : 'You have to scroll to the end, then accept terms.',
                            style: GoogleFonts.roboto(color: termsRedText, fontSize: 13.0),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 30,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          _maxExtent
                              ? setState(() {
                                  _scrollController.animateTo(_scrollController.position.minScrollExtent,
                                      duration: const Duration(seconds: 2), curve: Curves.easeOut);
                                })
                              : setState(() {
                                  _scrollController.animateTo(_scrollController.position.maxScrollExtent,
                                      duration: const Duration(seconds: 2), curve: Curves.easeOut);
                                });
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: lightBoxStroke,
                                blurRadius: 8.0,
                                spreadRadius: 0.0,
                                offset: Offset(2.0, 2.0),
                              ),
                            ],
                          ),
                          child: Icon(
                            _maxExtent ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                            size: 15,
                            color: green,
                          ),
                        ),
                      ),
                    ),
                  )
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
                    onTap: () {},
                    child: RoundedButton(
                      text: 'Back',
                      icon: Icons.arrow_back_ios,
                      width: 135.0,
                      color: roundButtonsDarkBg,
                      pretext: true,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _termsAccepted ? Get.offAll(() => const BottomNavigation()) : null;
                    },
                    child: RoundedButton(
                      text: 'Next',
                      icon: Icons.arrow_forward_ios,
                      width: 135.0,
                      color: _termsAccepted ? primaryColor : roundButtonsDarkBg,
                      pretext: false,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
