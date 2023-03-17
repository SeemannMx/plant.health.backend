import 'package:dart_frog/dart_frog.dart';
import 'package:plant_health_backend/models/models.dart';

Response onRequest(RequestContext context) {
  final state = context.read<State>();
  return Response(body: '$state');
}
