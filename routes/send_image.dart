import 'package:dart_frog/dart_frog.dart';
import 'package:plant_health_backend/models/models.dart';

Response onRequest(RequestContext context) {
  final state = context.read<Store>();
  return Response(body: '$state');
}
