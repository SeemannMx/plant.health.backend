import 'package:plant_health_backend/models/models.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

Store _state = Store(
  environment: 'not defined',
  images: <Image>[],
);

Store get state => _state;

void main() {
  print('run main');
  final env = const String.fromEnvironment('app.stage', defaultValue: 'dev');

  final uri = Uri.parse('ws://localhost:8080/ws');
  final channel = WebSocketChannel.connect(uri);

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

  channel.sink.add('hello');
}
