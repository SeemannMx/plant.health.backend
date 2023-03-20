import 'dart:developer';

import 'package:dart_frog/dart_frog.dart';
import 'package:plant_health_backend/models/models.dart';

Store _state = Store(
  environment: 'not defined',
  images: <Image>[],
);

/// middleware must be withi routes, otherwise internal server error
Handler middleware(Handler handler) {
  log('run middleware');

  final env = const String.fromEnvironment('app.stage', defaultValue: 'dev');

  if (env == 'dev') {
    _state = _state.rebuild(
      environment: "dev",
      images: <Image>[],
    );
  } else if (env == 'prod') {
    _state = _state.rebuild(
      environment: "prod",
      images: <Image>[],
    );
  }

  return handler
      .use(
        requestLogger(),
      )
      .use(
        provider<Store>((_) => _state),
      );
}
