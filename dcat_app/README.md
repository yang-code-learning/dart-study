A simple command-line application.
## Pre work
1. follow this guide: https://dart.dev/tutorials/server/cmdline
2. install dart by run "brew tap dart-lang/dart, brew install dart"
2. get dependencies by run "dart pub get"
## How to run this app?
1. head to the root dir of the project
2. simplely run "dart run bin/dcat_app.dart", then 
whatever you type in, the program print to the terminal
exactly the same using "stdin.pipe(stdout)", can shut down
using Ctrl + Z or Ctrl + C
3. if adding extra parameter (here i set -g), following 
with a file. (eg. "dart run bin/dcat_app.dart -g quote.txt")
in this example, the program will print lines in the file
to the terminal and adding number before each line.
4. if parameter fllowing with a dir 
(eg. "dart run bin/dcat_app.dart -g bin\)
it will raise a error "bin/ is a directory"
5. if parameter fllowing with any other meaningless word, 
the program will automaticlly shut down
## What's more 
1. add a function(getEnvInfo), print information about the system
2. add two function about write into file(writeFile1/2), 
not know why they can't work at same time, must comment one 
ensure the other works, you can check the result at the "quotes.txt"
3. all three can be commented, cause they are kinda boring.