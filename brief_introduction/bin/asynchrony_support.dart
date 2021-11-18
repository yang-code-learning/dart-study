// ignore_for_file: unused_local_variable

/* 1. Handling Futures */
// To use await, code must be in
// an async function—a function marked as async
Future<void> checkVersion() async {
  // Use try, catch, and finally to 
  // handle errors and cleanup in code that uses await
  try {
    var version = await lookUpVersion();
  } catch (e) {
    // React to inability to look up the version
  }
  // can use await multiple times in an async function
  /*   
   * var entrypoint = await findEntryPoint();
   * var exitCode = await runExecutable(entrypoint, args);
   * await flushThenExit(exitCode); 
   */
}

/* 2. Declaring async functions */
Future<String> lookUpVersion() async => '1.0.0';

/* 3. Handling Streams */
// get values from a Stream, you have two options
// Use async and an asynchronous for loop (await for).
// Use the Stream API

// An asynchronous for loop has the following form:
/* 
 * await for (varOrType identifier in expression) {
 *   // Executes each time the stream emits a value.
 * }
 */

void main(List<String> args) {
  print("nothing here to present/n");
}
