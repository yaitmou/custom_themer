// ignore: depend_on_referenced_packages
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:custom_themer_annotations/custom_themer_annotations.dart';

import 'model_visitor.dart';

class CustomColorsGenerator
    extends GeneratorForAnnotation<CustomColorsAnnotation> {
  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final visitor = ModelVisitor();
    element.visitChildren(visitor);
    final className = '\$${visitor.className}';

    final String argsThis = visitor.constructorArgs
        .map((e) => 'this.${e.name},')
        .toList()
        .join(' ');
    final String argsFinalColor = visitor.constructorArgs
        .map((e) => 'final Color? ${e.name};')
        .toList()
        .join(' ');
    final String argsColor = visitor.constructorArgs
        .map((e) => 'Color? ${e.name},')
        .toList()
        .join(' ');
    final String argsCopy = visitor.constructorArgs
        .map((e) => '${e.name} ?? this.${e.name},')
        .toList()
        .join(' ');
    final String argsLerp = visitor.constructorArgs
        .map((e) => 'Color.lerp(${e.name}, other.${e.name}, t),')
        .toList()
        .join(' ');
    final String argsToString = visitor.constructorArgs
        .map((e) => '${e.name}: \$${e.name},')
        .toList()
        .join(' ');

    final String argsDual = visitor.constructorArgs
        .map((e) => 'final DualColors \$${e.name};')
        .toList()
        .join(' ');
    final String argsProps = visitor.constructorArgs
        .map((e) => 'required DualColors ${e.name},')
        .toList()
        .join(' ');
    final String argsAssign = visitor.constructorArgs
        .map((e) => '\$${e.name} = ${e.name}')
        .toList()
        .join(',');
    final String argsDark = visitor.constructorArgs
        .map((e) => '\$${e.name}.dark,')
        .toList()
        .join(' ');
    final String argsLight = visitor.constructorArgs
        .map((e) => '\$${e.name}.light,')
        .toList()
        .join(' ');

    return '''
@immutable
class $className extends ThemeExtension<$className> {
  const $className([$argsThis]);
  $argsFinalColor

  @override
  $className copyWith({$argsColor}) {
    return $className($argsCopy);
  }

  // Controls how the properties change on theme changes
  @override
  $className lerp(ThemeExtension<$className>? other, double t) {
    if (other is! $className) {
      return this;
    }
    return $className($argsLerp);
  }

  @override
  String toString() => '$className($argsToString)';
}

class \$$className extends $className {
  $argsDual
  const \$$className({$argsProps}):$argsAssign;

  // the light theme
  ThemeExtension<dynamic> light() =>  $className($argsLight);
  // the dark theme
  ThemeExtension<dynamic> dark() =>  $className($argsDark);
  $className provider(context) =>
      Theme.of(context).extension<$className>()!;
}
class DualColors<Color> {
  final Color dark;
  final Color light;

  const DualColors({
    required this.dark,
    required this.light,
  });
}
''';
  }
}
