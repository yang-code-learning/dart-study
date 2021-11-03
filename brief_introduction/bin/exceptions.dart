void main(List<String> args) {
  /* 1. Throw */
  // throw FormatException('Expected at least 1 section');
  throw 'Out of llamas!';

  /* 2. Catch */
  // Catching an exception stops the exception from propagating
  /* 
   * try {
   *   breedMoreLlamas();
   * } on OutOfLlamasException {
   *   buyMoreLlamas();
   * }
   */

  // can specify multiple catch clauses
  /* 
   * try {
   *   breedMoreLlamas();
   * } on OutOfLlamasException {
   *   // A specific exception
   *   buyMoreLlamas();
   * } on Exception catch (e) {
   *   // Anything else that is an exception
   *   print('Unknown exception: $e');
   * } catch (e) {
   *   // No specified type, handles all
   *   print('Something really unknown: $e');
   * }
   */

  // two parameters，the second is the stack trace
  /* 
   * try {
   *   // ···
   * } on Exception catch (e) {
   *   print('Exception details:\n $e');
   * } catch (e, s) {
   *   print('Exception details:\n $e');
   *   print('Stack trace:\n $s');
   * }
   */

  // rethrow：handle an exception, while allowing it to propagate
  /* 
   * void misbehave() {
   *   try {
   *     dynamic foo = true;
   *     print(foo++); // Runtime error
   *   } catch (e) {
   *     print('misbehave() partially handled ${e.runtimeType}.');
   *     rethrow; // Allow callers to see the exception.
   *   }
   * }
   * 
   * void main() {
   *   try {
   *     misbehave();
   *   } catch (e) {
   *     print('main() finished handling ${e.runtimeType}.');
   *   }
   * }
   */

  /* 3. Finally */
  // To ensure that some code runs whether or not an exception is thrown
  /* 
   * try {
   *   breedMoreLlamas();
   * } finally {
   *   // Always clean up, even if an exception is thrown.
   *   cleanLlamaStalls();
   * }
   */

  // runs after any matching catch clauses
  /* 
   * try {
   *   breedMoreLlamas();
   * } catch (e) {
   *   print('Error: $e'); // Handle the exception first.
   * } finally {
   *   cleanLlamaStalls(); // Then clean up.
   * }
   */
}
