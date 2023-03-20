import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_health_backend/models/models.dart';
import 'package:test/test.dart';

import '../../../routes/state/index.dart' as route;

class _MockRequestContext extends Mock implements RequestContext {}

void main() {
  group('GET /', () {
    test('responds with a 200', () {
      final request = Request.get(Uri.parse('http://localhost/'));
      final context = _MockRequestContext();

      when(() => context.read<Store>()).thenReturn(Store());
      when(() => context.request).thenReturn(request);

      final response = route.onRequest(context);

      expect(response.statusCode, equals(HttpStatus.ok));
    });
  });
}
