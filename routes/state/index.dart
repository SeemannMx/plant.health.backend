import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:plant_health_backend/models/models.dart';

/// @request
/// => curl --request GET --url http://localhost:8080/state
/// @response:
/// => Store
Response onRequest(RequestContext context) {
  final state = context.read<Store>();

  switch (context.request.method) {
    case HttpMethod.get:
      return Response.json(body: state);
    default:
      return Response(statusCode: HttpStatus.badRequest);
  }
}
