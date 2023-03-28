import 'package:plant_health_backend/models/models.dart';

Store _state = Store(
  environment: 'not defined',
  images: <Image>[],
);

Store get state => _state;

void main() {
  print('run main');
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
}
