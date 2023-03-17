import 'dart:developer';

void main() {
  if (const String.fromEnvironment('app.stage') == 'dev') {
    log("run dev.main");
  } else {
    throw 'environment not defined app.stage != dev';
  }
}
