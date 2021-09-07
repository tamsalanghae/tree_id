import 'package:dalbergia_id/app/app.view.dart';
import 'package:dalbergia_id/config/application.dart';
import 'package:dalbergia_id/utils/shared_preferences.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Color.fromRGBO(0, 181, 156, 1),
    ),
  );
  var res = await Future.wait([
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom, SystemUiOverlay.top]),
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]),
    dotenv.load(fileName: ".env"),
    SpUtil.getInstance(),
  ]);
  Application.sharePreference = res.last as SpUtil;
  runApp(
    DevicePreview(
      enabled: dotenv.env["DEVICEPREVIEW"] == "true",
      builder: (context) => AppWidget(),
    ),
  );
}
