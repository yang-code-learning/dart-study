// ignore_for_file: unused_import

/* 1. Using libraries */
// 1.1 For example, Dart web apps generally use 
// the dart:html library
import 'dart:html';
// 1.2 For other libraries, you can 
// use a file system path or the package: scheme. 
import 'package:characters/characters.dart';

// 1.3 Specifying a library prefix
// import two libraries that have conflicting identifiers
/* 
 * import 'package:lib1/lib1.dart';
 * import 'package:lib2/lib2.dart' as lib2;
 * Element element1 = Element();
 * lib2.Element element2 = lib2.Element(); 
 */

// 1.4 importing only part of a library
/* 
 * // Import only foo.
 * import 'package:lib1/lib1.dart' show foo;
 * 
 * // Import all names EXCEPT foo.
 * import 'package:lib2/lib2.dart' hide foo;
 */

// 1.5 Lazily loading a library
// must first import it using deferred as
/* 
 * import 'package:greetings/hello.dart' deferred as hello;
 */
// When you need the library, invoke 
// loadLibrary() using the library’s identifier.
/* 
 * Future<void> greet() async {
 *   await hello.loadLibrary();
 *   hello.printGreeting();
 * }
 */


void main(List<String> args) {
  print("nothing here to present\n");
}