import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_health_backend/models/models.dart';
import 'package:test/test.dart';

import '../../../routes/state/index.dart' as route;

class _MockRequestContext extends Mock implements RequestContext {}

class _MockRequest extends Mock implements Request {}

void main() {
  group('GET /', () {
    final request = _MockRequest();
    final context = _MockRequestContext();
    final store = Store(
      environment: 'test',
      images: [
        Image(id: '2023'),
      ],
    );

    when(() => request.method).thenReturn(HttpMethod.get);
    when(() => context.request).thenReturn(request);
    when(() => context.read<Store>()).thenReturn(store);

    test('responds with a 200', () {
      final response = route.onRequest(context);
      expect(response.statusCode, equals(HttpStatus.ok));
    });

    test('responds with a state', () async {
      final response = route.onRequest(context);

      final json = await response.json();
      final expectedStore = Store.fromJson(json);

      expect(expectedStore, equals(store));
    });
  });
}
