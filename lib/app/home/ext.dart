extension MoreMethodString on String {
  String withOnlyUppercaseLetter() => split(" ").map((e) => e[0]).join();
}
