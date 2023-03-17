import 'package:dart_frog/dart_frog.dart';
import 'package:plant_health_backend/models/models.dart';

final _state = State();

Handler middleware(Handler handler) {
  return handler
      .use(
        requestLogger(),
      )
      .use(
        provider<State>((_) => _state),
      );
}
