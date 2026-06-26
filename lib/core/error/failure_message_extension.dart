import 'failures.dart';

extension FailureMessageX on Object {
  String toUserMessage() {
    return this is Failure ? (this as Failure).message : 'An unexpected error occurred';
  }
}