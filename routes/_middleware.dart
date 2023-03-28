import 'dart:async';

import 'package:dart_frog/dart_frog.dart';
import 'package:http/http.dart' as http;
import 'package:plant_health_backend/main.dart';
import 'package:plant_health_backend/models/models.dart';

int countdown = 10;

late Timer timer;

void _startTimer() {
  timer = Timer.periodic(Duration(seconds: 5), (timer) async {
    print('$countdown');
    _send();
    if (countdown == 0) {
      print('cancel timer');
      timer.cancel();
    }
    countdown--;
  });
}

void _send() async {
  final uri = Uri.parse('http://192.168.2.137/take_picture');
  await http.get(uri);
}

/// middleware must be withi routes, otherwise internal server error
Handler middleware(Handler handler) {
  print('run middleware');

  _startTimer();

  return handler
      .use(
        requestLogger(),
      )
      .use(
        provider<Store>((_) => state),
      );
}
