import 'package:ccts/src/presentation/mobile_ui/view/home/home_page.dart';
import 'package:ccts/src/presentation/web_ui/view/auth_screens/login_and_register_web.dart';
import 'package:ccts/src/presentation/web_ui/view/dashboard_web/sample_page.dart';
import 'package:ccts/src/presentation/web_ui/view/home/site_work.dart';
import 'package:ccts/src/presentation/web_ui/view/home/home_pageweb.dart';
import 'package:ccts/src/presentation/web_ui/view/home/material_cost.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


Widget? getPageWidget(RouteSettings settings) {
    if (settings.name == null) {
      return null;
    }
    final uri = Uri.parse(settings.name!);
    switch (uri.path) {
      case '/':
        return kIsWeb? const LoginAndRegisterWeb():  const HomePage(registerId: '1');
      case 'homePage':
        return const HomePageWeb();
      case 'samplePage':
        return const SamplePgae();
      case 'materialPage' :
        return const MaterialCostPage();
        case 'earthWorkPage' :
        return const SiteWorkPage();
    }
    return null;
  }