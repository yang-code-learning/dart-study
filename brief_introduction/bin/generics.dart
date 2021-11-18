/* 1. Why use generics? */
// <…> notation marks a type as a generic (or parameterized) type
// can results in better generated code.
// and reduce code duplication

// Generics let you share a single interface 
// and implementation between many types
abstract class Cache<T> {
  // T is the stand-in type which developer will define later
  T getByKey(String key);
  void setByKey(String key, T value);
}

/* 2. Using collection literals */
// List, set, and map literals can be parameterized. 
var names = <String>['Seth', 'Kathy', 'Lars'];
var uniqueNames = <String>{'Seth', 'Kathy', 'Lars'};
var pages = <String, String>{
  'index.html': 'Homepage',
  'robots.txt': 'Hints for web robots',
  'humans.txt': 'We are people, not machines'
};

/* 3. Using parameterized types with constructors */
var nameSet = Set<String>.from(names);
// var views = Map<int, View>();

/* 4. Generic collections and the types they contain */
var names2 = <String>[];

/* 5. Restricting the parameterized type */
class Foo1<T extends Object> {
  // Any type provided to Foo for T must be non-nullable.
}

class SomeBaseClass {
}

class Foo<T extends SomeBaseClass> {
  // Implementation goes here...
  @override
  String toString() => "Instance of 'Foo<$T>'";
}

class Extender extends SomeBaseClass {
  
}

// now it’s OK to use SomeBaseClass or any of 
// its subtypes as the generic argument
// It’s also OK to specify no generic argument:
var someBaseClassFoo = Foo<SomeBaseClass>();
var extenderFoo = Foo<Extender>();
var foo = Foo(); // Instance of 'Foo<SomeBaseClass>'
// Specifying any non-SomeBaseClass type results in an error:
// like "var foo = Foo<Object>();""

/* 6. Using generic methods */
T first<T>(List<T> ts) {
  // Do some initial work or error checking, then...
  T tmp = ts[0];
  // Do some additional checking or processing...
  return tmp;
}

void main(List<String> args) {
  /* 4. Generic collections and the types they contain */
  names2.addAll(['Seth', 'Kathy', 'Lars']);
  print(names2 is List<String>); // true
}