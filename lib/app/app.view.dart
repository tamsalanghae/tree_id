import 'package:dalbergia_id/app/home/home.view.dart';
import 'package:dalbergia_id/app/splash-screen/splash-screen.view.dart';
import 'package:dalbergia_id/config/application.dart';
import 'package:dalbergia_id/config/locale.dart';
import 'package:dalbergia_id/themes/style.dart';
import 'package:dalbergia_id/utils/audio_helper.dart';
import 'package:dalbergia_id/utils/custom_toast.dart';
import 'package:device_preview/device_preview.dart' hide DeviceType;
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class AppWidget extends StatelessWidget {
  AppWidget() {
    Application.toast = Toastify();
    Application.audioHelper = AudioHelper.init();
    Application.sharePreference.putString('locale', "vi_vn");
    Intl.defaultLocale = Application.sharePreference.getString('locale');
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
        defaultTransition: Transition.rightToLeftWithFade,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        title: 'Dalbergia Id',
        supportedLocales: AppLocale.locales.values,
        locale: AppLocale.locales[Application.sharePreference.getString('locale')],
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          canvasColor: Colors.white,
          accentColor: AppColor.accentColor,
          fontFamily: "Quicksand",
          unselectedWidgetColor: Color(0xffd3d3d3),
          scrollbarTheme: ScrollbarThemeData(thumbColor: MaterialStateProperty.all(Color(0xFFE5F3FD))),
        ),
        debugShowCheckedModeBanner: false,
        builder: DevicePreview.appBuilder,
        home: SplashScreen(),
        getPages: [
          GetPage(name: "/home", page: () => HomePage(), transition: Transition.topLevel),
        ],
      ),
    );
  }
}
