import 'package:dart_frog/dart_frog.dart';
import 'package:plant_health_backend/main.dart';
import 'package:plant_health_backend/models/models.dart';

/// middleware must be withi routes, otherwise internal server error
Handler middleware(Handler handler) {
  print('run middleware');
  return handler
      .use(
        requestLogger(),
      )
      .use(
        provider<Store>((_) => state),
      );
}
