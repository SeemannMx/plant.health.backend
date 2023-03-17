import 'package:dart_frog/dart_frog.dart';
import 'package:plant_health_backend/models/models.dart';
import 'package:plant_health_backend/state.dart';

Handler middleware(Handler handler) {
  return handler
      .use(
        requestLogger(),
      )
      .use(
        provider<Store>((_) => state),
      );
}
