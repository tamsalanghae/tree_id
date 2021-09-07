import 'package:sizer/sizer.dart';

class Responsive {
  static bool get isMobile => SizerUtil.deviceType == DeviceType.mobile;

  static double get sizeText => isMobile ? 12.sp : 8.sp;

  static double get fillIn => isMobile ? 9.sp : 5.5.sp;

  static double get sizeImage => isMobile ? 2.5 : 1.5;

  static double get sizeOperator => isMobile ? 12.sp : 7.sp;
}
