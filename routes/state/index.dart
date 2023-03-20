import 'package:dart_frog/dart_frog.dart';
import 'package:plant_health_backend/models/models.dart';

/// @request
/// => curl --request GET --url http://localhost:8080/image
/// @response:
/// => Store
Response onRequest(RequestContext context) {
  final state = context.read<Store>();
  return Response(body: '$state');
}
