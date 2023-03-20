import 'package:plant_health_backend/models/image.dart';
import 'package:plant_health_backend/state.dart';

void main() {
  final env = const String.fromEnvironment('app.stage', defaultValue: 'dev');

  if (env == 'dev') {
    state = state.rebuild(
      environment: "dev",
      images: <Image>[],
    );
  } else if (env == 'prod') {
    state = state.rebuild(
      environment: "prod",
      images: <Image>[],
    );
  }
}
