import 'package:flutter/material.dart';

@immutable
class VariableColors extends ThemeExtension<VariableColors> {
  const VariableColors({
    required this.appBarBack,
    required this.bodyBack,
    required this.generalBack,
    required this.blackVSwhite,
    required this.textColor100,
    required this.textColor200,
    required this.textColor300,
  });
  final Color? appBarBack;
  final Color? bodyBack;
  final Color? generalBack;
  final Color? blackVSwhite;
  final Color? textColor100;
  final Color? textColor200;
  final Color? textColor300;

  static const VariableColors light = VariableColors(
    appBarBack: Color(0xFFeeeeee), //grey[200]
    bodyBack: Color(0xFFbdbdbd), //grey[400]
    generalBack: Color(0xFFeeeeee), //grey200
    blackVSwhite: Color(0xFF000000),
    textColor100: Color(0xFF000000), //black
    textColor200: Color(0xFF9e9e9e), //grey
    textColor300: Color(0xFF212121), //grey[900]
  );
  static const VariableColors dark = VariableColors(
    appBarBack: Color(0xFF212121), //grey900
    bodyBack: Color(0xFF000000), //black
    generalBack: Color(0xFF212121), //grey900
    blackVSwhite: Color(0xFFFFFFFF),
    textColor100: Color(0xFFeeeeee), //grey200
    textColor200: Color(0xFF9e9e9e), //grey
    textColor300: Color(0xFFFFFFFF), //grey[200]
  );

  @override
  VariableColors copyWith({Color? backgroundDark, Color? backgroundLight}) =>
      VariableColors(
        appBarBack: appBarBack ?? this.appBarBack,
        bodyBack: bodyBack ?? this.bodyBack,
        generalBack: generalBack ?? this.generalBack,
        blackVSwhite: blackVSwhite ?? this.blackVSwhite,
        textColor100: textColor100 ?? this.textColor100,
        textColor200: textColor200 ?? this.textColor200,
        textColor300: textColor300 ?? this.textColor300,
      );

  @override
  VariableColors lerp(ThemeExtension<VariableColors>? other, double t) {
    if (other is! VariableColors) return this;
    return VariableColors(
      appBarBack: Color.lerp(appBarBack, other.appBarBack, t),
      bodyBack: Color.lerp(bodyBack, other.bodyBack, t),
      generalBack: Color.lerp(generalBack, other.generalBack, t),
      blackVSwhite: Color.lerp(blackVSwhite, other.blackVSwhite, t),
      textColor100: Color.lerp(textColor100, other.textColor100, t),
      textColor200: Color.lerp(textColor200, other.textColor200, t),
      textColor300: Color.lerp(textColor300, other.textColor300, t),
    );
  }
}
