import 'package:dart_frog/dart_frog.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_health_backend/models/models.dart';
import 'package:test/test.dart';

import '../routes/_middleware.dart';

class _MockRequestContext extends Mock implements RequestContext {}

void main() {
  final context = _MockRequestContext();
  final request = Request.get(Uri.parse('http://localhost/'));
  var state = Store(images: <Image>[]);

  when(() => context.request).thenReturn(request);

  group('GIVEN a middleware', () {
    final handler = middleware(
      (context) {
        state = context.read<Store>();
        return Response.json();
      },
    );

    group('WHEN a request to endpoint is triggered', () {
      test('THEN it returns a valid state', () async {
        await handler(context);
        expect(state.images?.length, equals(0));
      });
    });
  });
}
