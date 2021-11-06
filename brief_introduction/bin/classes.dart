// ignore_for_file: annotate_overrides, unnecessary_overrides

import 'string_apis.dart';
import 'dart:math';

class Pointnull {
  /* 4. Instance variables */
  double? x; // Declare instance variable x, initially null.
  double? y; // Declare y, initially null.
}

class Point {
  /* 4. Instance variables */
  double x = 0;
  double y = 0;
  /* 5. Constructors */
  /* 
  Point(double x, double y) {
    // There's a better way to do this, stay tuned.
    this.x = x;
    this.y = y; 
  }
  */

  // Syntactic sugar for setting x and y
  // before the constructor body runs.
  Point(this.x, this.y);

  // Named constructor
  Point.origin(xOrigin, yOrigin)
      : x = xOrigin,
        y = yOrigin;

  // Initializer list sets instance variables before
  // the constructor body runs.
  Point.fromJson(Map<String, double> json)
      : x = json['x']!,
        y = json['y']! {
    print('In Point.fromJson(): ($x, $y)');
  }
  // During development, you can validate inputs
  // by using assert in the initializer list.
  Point.withAssert(this.x, this.y) : assert(x >= 0) {
    print('In Point.withAssert(): ($x, $y)');
  }
  // Redirecting constructors: constructor’s body is empty, with the constructor
  // call (using this instead of the class name) appearing after a colon (:).
  // Delegates to the main constructor.
  Point.alongXAxis(double x) : this(x, 0);

  // Instance methods
  double distanceTo(Point other) {
    var dx = x - other.x;
    var dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }

  // Static methods
  static double distanceBetween(Point a, Point b) {
    var dx = a.x - b.x;
    var dy = a.y - b.y;
    return sqrt(dx * dx + dy * dy);
  }
}

// Constant constructors
// define a const constructor and
// make sure that all instance variables are final.
class ImmutablePoint {
  static const ImmutablePoint origin = ImmutablePoint(0, 0);
  final double x, y;
  const ImmutablePoint(this.x, this.y);
}

/* 4. Instance variables */
class ProfileMark {
  // Instance variables can be final, in which case they must be set exactly once
  final String name;
  final DateTime start = DateTime.now();

  ProfileMark(this.name);
  ProfileMark.unnamed() : name = '';
  // If you need to assign the value of a final instance variable after the constructor
  // Use a factory constructor
  // Use late final, but be careful: a late final without an initializer adds a setter to the API.
}

/* 5. Constrcutor */
class Person {
  String? firstName;

  Person.fromJson(Map data) {
    print('in Person');
  }
}

class Employee extends Person {
  // Person does not have a default constructor;
  // you must call super.fromJson(data).
  Employee.fromJson(Map data) : super.fromJson(data) {
    print('in Employee');
  }
}

// Factory constructors
class Logger {
  final String name;
  bool mute = false;

  // _cache is library-private, thanks to
  // the _ in front of its name.
  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  factory Logger.fromJson(Map<String, Object> json) {
    return Logger(json['name'].toString());
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }
}

/* 6. Methods: Operators */
class Vector {
  final int x, y;

  Vector(this.x, this.y);

  Vector operator +(Vector v) => Vector(x + v.x, y + v.y);
  Vector operator -(Vector v) => Vector(x - v.x, y - v.y);

  // Operator == and hashCode not shown.
  // ···
}

/* 6. Methods: Getters and setters*/
class Rectangle {
  double left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  // Define two calculated properties: right and bottom.
  double get right => left + width;
  set right(double value) => left = value - width;
  double get bottom => top + height;
  set bottom(double value) => top = value - height;
}

/* 6. Methods: Abstract methods */
abstract class Doer {
  // Define instance variables and methods...

  void doSomething(); // Define an abstract method.
}

/* 7. Abstract classes */
// This class is declared abstract and thus
// can't be instantiated.
abstract class AbstractContainer {
  // Define constructors, fields, methods...

  void updateChildren(); // Abstract method.
}

class EffectiveDoer extends Doer {
  void doSomething() {
    print("do something");
    // Provide an implementation, so the method is not abstract here...
  }
}

/* 8. Implicit interfaces */
// A person. The implicit interface contains greet().
class Personn {
  // In the interface, but visible only in this library.
  final String _name;

  // Not in the interface, since this is a constructor.
  Personn(this._name);

  // In the interface.
  String greet(String who) => 'Hello, $who. I am $_name.';
}

// An implementation of the Person interface.
class Impostor implements Personn {
  String get _name => '';

  String greet(String who) => 'Hi $who. Do you know who I am?';
}

String greetBob(Personn person) => person.greet('Bob');

/* 9. Extending a class */
class Television {
  void turnOn() {
    // _illuminateDisplay();
    // _activateIrSensor();
  }
  // ···
}

class SmartTelevision extends Television {
  void turnOn() {
    super.turnOn();
    // _bootNetworkInterface();
    // _initializeMemory();
    // _upgradeApps();
  }
  // ···
}

/* 9. Extending a class: Overriding members */
class Televisionn {
  // ···
  set contrast(int value) {
    // ...
  }
}

class SmartTelevisionn extends Televisionn {
  @override
  set contrast(num value) {
    // ...
  }
  // ···
}

/* 9. Extending a class: noSuchMethod() */
// o detect or react whenever code attempts to
//use a non-existent method or instance variable
class A {
  // Unless you override noSuchMethod, using a
  // non-existent member results in a NoSuchMethodError.
  @override
  void noSuchMethod(Invocation invocation) {
    print('You tried to use a non-existent member: '
        '${invocation.memberName}');
  }
}

/* 10. Enumerated types: Using enums */
enum Color { red, green, blue }

/* 11. Adding features to a class: mixins */
class Performer {
  String? name;
}

mixin Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }
}

mixin Aggressive {
  // ...
}

mixin Demented {
  // ...
}

class Musician extends Performer with Musical {
  // ···
}

class Maestro extends Personn with Musical, Aggressive, Demented {
  String? name;
  Maestro(String maestroName) : super('') {
    name = maestroName;
    canConduct = true;
  }
}

/* 12. Class variables and methods: Static variables */
class Queue {
  static const initialCapacity = 16;
  // ···
}

void main(List<String> args) {
  /* 1. Using class members */
  var p = Point(2, 2);
  // Get the value of y.
  assert(p.y == 2);
  // Invoke distanceTo() on p.
  double distance = p.distanceTo(Point(4, 4));
  // If p is non-null, set a variable equal to its y value.
  // var a = p?.y;

  /* 2. Using constructors */
  // the new keyword before the constructor name is optional
  var p1 = Point(2, 2);
  var p2 = Point.fromJson({'x': 1, 'y': 2});
  print("${p1.x}, ${p1.y}");
  print("${p2.x}, ${p2.y}");

  // Constructing two identical compile-time constants results in a single, canonical instance
  var a = const ImmutablePoint(1, 1);
  var b = const ImmutablePoint(1, 1);
  assert(identical(a, b)); // They are the same instance!
  // Within a constant context, you can omit the const before a constructor or literal
  // Lots of const keywords here.
  /*
   * const pointAndLine = const {
   *     'point': const [const ImmutablePoint(0, 0)],
   *     'line': const [const ImmutablePoint(1, 10), const ImmutablePoint(-2, 11)],
   *   };
   */
  // Only one const, which establishes the constant context.
  // ignore: unused_local_variable
  const pointAndLine = {
    'point': [ImmutablePoint(0, 0)],
    'line': [ImmutablePoint(1, 10), ImmutablePoint(-2, 11)],
  };
  // If a constant constructor is outside of a constant context and is invoked without const, it creates a non-constant object
  var a1 = const ImmutablePoint(1, 1); // Creates a constant
  var b1 = ImmutablePoint(1, 1); // Does NOT create a constant
  assert(!identical(a1, b1)); // NOT the same instance!

  /* 3. Getting an object’s type */
  print('The type of a is ${a.runtimeType}');

  /* 4. Instance variables */
  // All uninitialized instance variables have the value null.
  var pointnull = Pointnull();
  pointnull.x = 4; // Use the setter method for x.
  assert(pointnull.x == 4); // Use the getter method for x.
  assert(pointnull.y == null); // Values default to null.

  /* 5. Constructors */
  // Default constructors: If you don’t declare a constructor, a default constructor is provided
  // Constructors aren’t inherited: ubclasses don’t inherit constructors from their superclass.
  // Named constructors: Use a named constructor to implement multiple constructors for a class or to provide extra clarity
  // Invoking a non-default superclass constructor
  var employee = Employee.fromJson({});
  print(employee);
  // Initializer list:
  // Redirecting constructors
  // Redirecting constructors
  // Factory constructors
  var logger = Logger('UI');
  logger.log('Button clicked');

  var logMap = {'name': 'UI'};
  // ignore: unused_local_variable
  var loggerJson = Logger.fromJson(logMap);

  /* 6. Methods */
  // Instance methods
  print(distance);

  // Operators
  final v = Vector(2, 3);
  final w = Vector(2, 2);

  assert(v + w == Vector(4, 5));
  assert(v - w == Vector(0, 1));

  //Getters and setters
  var rect = Rectangle(3, 4, 20, 15);
  assert(rect.left == 3);
  rect.right = 12;
  assert(rect.left == -8);

  // Abstract methods
  EffectiveDoer effectiveDoer = EffectiveDoer();
  effectiveDoer.doSomething();

  /* 7. Abstract classes */

  /* 8. Implicit interfaces */
  print(greetBob(Personn('Kathy')));
  print(greetBob(Impostor()));

  /* 9. Extending a class */
  // Overriding members
  print('42'.padLeft(5)); // Use a String method.
  print('42'.parseInt()); // Use an extension method.

  /* 10. Enumerated types */
  assert(Color.red.index == 0);
  assert(Color.green.index == 1);
  assert(Color.blue.index == 2);

  List<Color> colors = Color.values;
  assert(colors[2] == Color.blue);

  var aColor = Color.blue;
  // must handle all of the enum’s values
  switch (aColor) {
    case Color.red:
      print('Red as roses!');
      break;
    case Color.green:
      print('Green as grass!');
      break;
    default: // Without this, you see a WARNING.
      print(aColor); // 'Color.blue'
  }

  /* 11. Adding features to a class: mixins */

  /* 12. Class variables and methods */
  // Static variables: Static variables aren’t initialized until they’re used.
  assert(Queue.initialCapacity == 16);
  // Static methods
  var a2 = Point(2, 2);
  var b2 = Point(4, 4);
  var distance2 = Point.distanceBetween(a2, b2);
  assert(2.8 < distance2 && distance2 < 2.9);
  print(distance2);
}
