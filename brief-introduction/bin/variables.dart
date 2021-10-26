void variableTest() {
  /* Creating and initializing */
  var name1 = 'Alice'; // a reference to a String object.
  Object name2 = 'Bob'; // ont only String object, can specify the Object type
  String name3 = 'Cindy'; // explicitly declare the type that would be inferred
  print("var name $name1, Object name $name2, String name $name3");

  /* Default value */
  int? lineCount1; // ? means it is a nullable type, have an initial value null.
  assert(lineCount1 == null); // condition is true, nothing happen

  int lineCount2; // must initialize non-nullable variables before use(null safety)
  lineCount2 = 42; // don’t have to initialize avariable where it’s declared
  print(lineCount2); // Dart can detect that lineCount2 is non-null when print

  /* Late variables */
  late String slogan; // can't always know variable is non-null, here comes late
  slogan = 'Geronino!';
  print(slogan);
  /* late String temperature = _readThermometer(); // late combined initialization
   * the initializer only run when variable is uesd, which means don't need to 
   * initializing a expensive function _readThermometer() 
   * if temperature variable is never used(lazy initialization is handy) */

  /* Final and const */
  final name = 'Bob'; // without a type annotation, final can be set only once
  final String nickname = 'Bobby'; // you can’t change a final variable' value
  print("a guy named $name has a nickname $nickname");

  const centibar = 1000000; // unit of pressure (dynes/cm2)
  const double atm = 1.01325 * centibar; // standard atmosphere
  print("the unit of pressur is $centibar, the atmosphere is $atm");

  var foo = const [4, 5, 6]; // can also use it to create constant values
  final bar = const [0, 0, 0]; // actually can omit const for final variables
  const baz = [1, 1, 1]; // equivalent to `const [1, 1, 1]`
  print("foo = " +
      foo.toString() +
      ", bar = " +
      bar.toString() +
      ", baz = " +
      baz.toString());

  foo = [1, 2, 3]; // was const [], but change to [1, 2, 3]
  print("now foo=" + foo.toString());
  // bar = [42]; // unlike foo, you can’t change the value of a const variable

  const Object i = 3; // where i is a const Object with an int value...
  const list = [i as int]; // use a typecast.
  const map = {if (i is int) i: 'int'}; // use is and collection if.
  const set = {if (list is List<int>) ...list}; // ...and a spread.
  print("map = " + map.toString() + " and set = " + set.toString());
}

void main(List<String> arguments) {
  print("\n4. Variable test");
  variableTest();
}