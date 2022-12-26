// This is were we pull all elementary information about the source class. These
// elements will then be passed to our generators to consume them for code
// creation

// ignore: depend_on_referenced_packages

import 'package:analyzer/dart/element/visitor.dart';
// ignore: depend_on_referenced_packages
import 'package:analyzer/dart/element/element.dart';

class ModelVisitor extends SimpleElementVisitor<void> {
  late String className;
  Map<String, dynamic> fields = {};
  List<Element> constructorArgs = [];

  @override
  void visitConstructorElement(ConstructorElement element) {
    final elementReturnType = element.type.returnType.toString();
    className = elementReturnType.replaceFirst('*', '');
    constructorArgs = element.children;
  }

  @override
  void visitFieldElement(FieldElement element) {
    final elementType = element.type.toString();
    fields[element.name] = elementType.replaceFirst('*', '');
  }
}
