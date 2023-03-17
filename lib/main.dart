import 'dart:developer';

void main() {
  final env = const String.fromEnvironment('app.stage');
  if (env == 'dev') {
    log("run dev.main");
  } else {
    // throw 'environment not defined app.stage != dev';
  }
}
