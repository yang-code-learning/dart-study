import 'dart:html';
import 'dart:convert';
import 'dart:math';
/* 1. get started */
Iterable<String> thingsTodo() sync* {
  const actions = ['Walk', 'Wash', 'Feed'];
  const pets = ['cats', 'dogs'];

  for (final action in actions) {
    for (final pet in pets) {
      if (pet != 'cats' || action == 'Feed') {
        yield '$action the $pet';
      }
    }
  }
}

void addTodoItem(String item) {
  final listElement = LIElement()..text = item;
  todoList.children.add(listElement);
}

late final UListElement todoList = querySelector('#todolist') as UListElement;

LIElement newLI(String itemText) => LIElement()..text = itemText;

/* 2. Fetching data dynamically (JSON) */
// Input fields
late final InputElement favoriteNumber;
late final InputElement valueOfPi;
late final InputElement horoscope;
late final InputElement favOne;
late final InputElement favTwo;
late final InputElement favThree;
late final RadioButtonInputElement loveChocolate;
late final RadioButtonInputElement noLoveForChocolate;

// Result fields
late final TextAreaElement intAsJson;
late final TextAreaElement doubleAsJson;
late final TextAreaElement stringAsJson;
late final TextAreaElement listAsJson;
late final TextAreaElement boolAsJson;
late final TextAreaElement mapAsJson;

// Pre-fill the form with some default values.
void _populateFromJson() {
  const jsonDataAsString = '''{
    "favoriteNumber": 73,
    "valueOfPi": 3.141592,
    "chocolate": true,
    "horoscope": "Cancer",
    "favoriteThings": ["monkeys", "parrots", "lattes"]
  }''';

  Map jsonData = json.decode(jsonDataAsString) as Map;

  favoriteNumber.value = jsonData['favoriteNumber'].toString();
  valueOfPi.value = jsonData['valueOfPi'].toString();
  horoscope.value = jsonData['horoscope'].toString();
  final favoriteThings = jsonData['favoriteThings'] as List<String>;
  favOne.value = favoriteThings[0];
  favTwo.value = favoriteThings[1];
  favThree.value = favoriteThings[2];

  final chocolateRadioButton =
      jsonData['chocolate'] == false ? noLoveForChocolate : loveChocolate;
  chocolateRadioButton.checked = true;
}

/// Display all values as JSON.
void _showJson([Event? _]) {
  // Grab the data that will be converted to JSON.
  final favNum = int.tryParse(favoriteNumber.value ?? '');
  final pi = double.tryParse(valueOfPi.value ?? '');
  final chocolate = loveChocolate.checked;
  final sign = horoscope.value;
  final favoriteThings = <String>[
    favOne.value ?? '',
    favTwo.value ?? '',
    favThree.value ?? '',
  ];

  final formData = {
    'favoriteNumber': favNum,
    'valueOfPi': pi,
    'chocolate': chocolate,
    'horoscope': sign,
    'favoriteThings': favoriteThings
  };

  // Convert to JSON and display results.
  intAsJson.text = json.encode(favNum);
  doubleAsJson.text = json.encode(pi);
  boolAsJson.text = json.encode(chocolate);
  stringAsJson.text = json.encode(sign);
  listAsJson.text = json.encode(favoriteThings);
  mapAsJson.text = json.encode(formData);
}

void jsonTest() {
  // Set up the input text areas.
  favoriteNumber = querySelector('#favoriteNumber') as InputElement;
  valueOfPi = querySelector('#valueOfPi') as InputElement;
  horoscope = querySelector('#horoscope') as InputElement;
  favOne = querySelector('#favOne') as InputElement;
  favTwo = querySelector('#favTwo') as InputElement;
  favThree = querySelector('#favThree') as InputElement;
  loveChocolate = querySelector('#loveChocolate') as RadioButtonInputElement;
  noLoveForChocolate =
      querySelector('#noLoveForChocolate') as RadioButtonInputElement;

  // Set up the results text areas
  // to display the values as JSON.
  intAsJson = querySelector('#intAsJson') as TextAreaElement;
  doubleAsJson = querySelector('#doubleAsJson') as TextAreaElement;
  boolAsJson = querySelector('#boolAsJson') as TextAreaElement;
  stringAsJson = querySelector('#stringAsJson') as TextAreaElement;
  listAsJson = querySelector('#listAsJson') as TextAreaElement;
  mapAsJson = querySelector('#mapAsJson') as TextAreaElement;

  // Set up the listeners.
  favoriteNumber.onKeyUp.listen(_showJson);
  valueOfPi.onKeyUp.listen(_showJson);
  loveChocolate.onClick.listen(_showJson);
  noLoveForChocolate.onClick.listen(_showJson);
  horoscope.onKeyUp.listen(_showJson);
  favOne.onKeyUp.listen(_showJson);
  favTwo.onKeyUp.listen(_showJson);
  favThree.onKeyUp.listen(_showJson);

  _populateFromJson();
  _showJson();
}

/* 3.1 Connect Dart & html */

/* 3.2 Add & remove DOM element */
late InputElement toDoInput;
late UListElement toDoList;
late ButtonElement deleteAll;

void addToDoItem(Event e) {
  var newToDo = LIElement();
  newToDo.text = toDoInput.value;
  newToDo.onClick.listen((e) => newToDo.remove());
  toDoInput.value = '';
  toDoList.children.add(newToDo);
}

void addRemoveDOMTest() {
  toDoInput = querySelector('#to-do-input') as InputElement;
  toDoList = querySelector('#to-do-list') as UListElement;
  toDoInput.onChange.listen(addToDoItem);
  deleteAll = querySelector('#delete-all') as ButtonElement;
  deleteAll.onClick.listen((e) => toDoList.children.clear());
}


/* 3.3 Moving elements within the DOM tree */
String scrabbleLetters =
    'aaaaaaaaabbccddddeeeeeeeeeeeeffggghhiiiiiiiiijkllllmmnnnnnnooooooooppqrrrrrrssssttttttuuuuvvwwxyyz**';

List<ButtonElement> buttons = [];
late Element letterpile;
late Element result;
late ButtonElement clearButton;
late Element value;
int wordvalue = 0;

Map scrabbleValues = { 'a':1, 'e':1, 'i':1, 'l':1, 'n':1,
                       'o':1, 'r':1, 's':1, 't':1, 'u':1,
                       'd':2, 'g':2, 'b':3, 'c':3, 'm':3,
                       'p':3, 'f':4, 'h':4, 'v':4, 'w':4,
                       'y':4, 'k':5, 'j':8, 'x':8, 'q':10,
                       'z':10, '*':0 };

void moveLetter(Event e) {
  Element letter = e.target as Element;
  if (letter.parent == letterpile) {
    result.children.add(letter);
    wordvalue += scrabbleValues[letter.text] as int;
    value.text = "$wordvalue";
  } else {
    letterpile.children.add(letter);
    wordvalue -= scrabbleValues[letter.text] as int;
    value.text = "$wordvalue";
  }
}

void newletters(Event e) {
  letterpile.children.clear();
  result.children.clear();
  generateNewLetters();
}

generateNewLetters() {
  Random indexGenerator = Random();
  wordvalue = 0;
  value.text = '';
  buttons.clear();
  for (var i = 0; i < 7; i++) {
    int letterIndex = indexGenerator.nextInt(scrabbleLetters.length);
    // Should remove the letter from scrabbleLetters to keep the
    // ratio correct.
    buttons.add(ButtonElement());
    buttons[i].classes.add("letter");
    buttons[i].onClick.listen(moveLetter);
    buttons[i].text = scrabbleLetters[letterIndex];
    letterpile.children.add(buttons[i]);
  }
}

void moveDOMTest() {
  letterpile = querySelector("#letterpile") as Element;
  result = querySelector("#result") as Element;
  value = querySelector("#value") as Element;

  clearButton = querySelector("#clearButton") as ButtonElement;
  clearButton.onClick.listen(newletters);

  generateNewLetters();
}

void main() {
  /* 1. get started */
  querySelector('#output')?.children.addAll(thingsTodo().map(newLI));
  /* 3.1 Connect Dart & html */
  querySelector('#RipVanWinkle')?.text = 'Wake up, sleepy head!';
  /* 3.2 Add & remove DOM element */
  addRemoveDOMTest();
  /* 3.3 Moving elements within the DOM tree */
  moveDOMTest();
  /* 2. Fetching data dynamically (JSON) */
  jsonTest();
}
