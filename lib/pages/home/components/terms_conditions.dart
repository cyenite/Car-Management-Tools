import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/constants.dart';
import '../../../widgets/rounded_button.dart';
import 'accept_terms.dart';

class TermsConditions extends StatefulWidget {
  const TermsConditions({Key? key}) : super(key: key);

  @override
  State<TermsConditions> createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
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
              'It takes a few steps and less than 2 minutes\n to inspect your car.',
              style: GoogleFonts.rubik(color: lightText, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            largeVSpacer,
            smallVSpacer,
            Image.asset('assets/images/terms_illustration.png'),
            largeVSpacer,
            smallVSpacer,
            InkWell(
              onTap: () {
                Get.to(() => const AcceptTerms());
              },
              child: RoundedButton(
                text: 'Let\'s accept terms',
                icon: Icons.arrow_forward_ios,
                width: MediaQuery.of(context).size.width * 0.7,
                color: primaryColor,
                pretext: false,
              ),
            ),
            largeVSpacer,
          ],
        ),
      ),
    );
  }
}
