import 'package:custom_themer_annotations/custom_themer_annotations.dart';
import 'package:flutter/material.dart';

part 'custom_color_scheme.g.dart';

@generateCustomColors
class CustomColorScheme extends $$CustomColorScheme {
  const CustomColorScheme({
    super.background = const DualColors(
      dark: Colors.white,
      light: Colors.black,
    ),
    super.foreground = const DualColors(
      dark: Colors.black,
      light: Colors.white,
    ),
  });
}

// @immutable
// class $CustomColorScheme extends ThemeExtension<$CustomColorScheme> {
//   const $CustomColorScheme([
//     this.background,
//     this.foreground,
//   ]);
//   final Color? background;
//   final Color? foreground;

//   @override
//   $CustomColorScheme copyWith({
//     Color? background,
//     Color? foreground,
//   }) {
//     return $CustomColorScheme(
//       background ?? this.background,
//       foreground ?? this.foreground,
//     );
//   }

//   // Controls how the properties change on theme changes
//   @override
//   $CustomColorScheme lerp(ThemeExtension<$CustomColorScheme>? other, double t) {
//     if (other is! $CustomColorScheme) {
//       return this;
//     }
//     return $CustomColorScheme(
//       Color.lerp(background, other.background, t),
//       Color.lerp(foreground, other.foreground, t),
//     );
//   }

//   @override
//   String toString() =>
//       '$CustomColorScheme(background: $background, foreground: $foreground,)';
// }

// class $$CustomColorScheme extends $CustomColorScheme {
//   final DualColors $background;
//   final DualColors $foreground;
//   const $$CustomColorScheme({
//     required DualColors background,
//     required DualColors foreground,
//   })  : $background = background,
//         $foreground = foreground;

//   // the light theme
//   ThemeExtension<dynamic> light() => $CustomColorScheme(
//         $background.light,
//         $foreground.light,
//       );
//   // the dark theme
//   ThemeExtension<dynamic> dark() => $CustomColorScheme(
//         $background.dark,
//         $foreground.dark,
//       );
//   $CustomColorScheme provider(context) =>
//       Theme.of(context).extension<$CustomColorScheme>()!;
// }

// class DualColors<Color> {
//   final Color dark;
//   final Color light;

//   const DualColors({
//     required this.dark,
//     required this.light,
//   });
// }
