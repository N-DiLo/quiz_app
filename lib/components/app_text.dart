import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final Color? color;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? lineHeight;
  final double? letterSpacing;
  final int? maxLines;

  const AppText({
    Key? key,
    required this.text,
    required this.fontSize,
    this.overflow,
    this.fontWeight,
    this.letterSpacing,
    this.color,
    this.lineHeight,
    this.maxLines,
    this.textAlign,
    this.softWrap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: softWrap,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow,
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
      style: GoogleFonts.inter(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        height: lineHeight,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

class QuizText extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final Color? color;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? lineHeight;
  final double? letterSpacing;
  final int? maxLines;

  const QuizText({
    Key? key,
    required this.text,
    required this.fontSize,
    this.overflow,
    this.fontWeight,
    this.letterSpacing,
    this.color,
    this.lineHeight,
    this.maxLines,
    this.textAlign,
    this.softWrap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: softWrap,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: overflow,
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
      style: GoogleFonts.quicksand(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        height: lineHeight,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
