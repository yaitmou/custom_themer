library custom_themer;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/custom_colors_generator.dart';

Builder generateCustomColors(BuilderOptions options) => SharedPartBuilder(
      [CustomColorsGenerator()],
      'customScheme',
    );
