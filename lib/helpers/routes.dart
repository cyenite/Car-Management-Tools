import 'package:car_management_tools/pages/home/components/sub_accept_terms.dart';
import 'package:get/get.dart';

import '../pages/pages.dart';

appRoutes() => [
      GetPage(
        name: '/root',
        page: () => const BottomNavigation(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/home',
        page: () => const HomePage(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/rate',
        page: () => const RateDriverPage(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/business',
        page: () => const BusinessPage(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/recruitment',
        page: () => const RecruitmentPage(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/accept-terms',
        page: () => const AcceptTerms(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500),
      ),
    ];

class Middelwares extends GetMiddleware {}
