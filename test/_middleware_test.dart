import 'package:dart_frog/dart_frog.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plant_health_backend/models/models.dart';
import 'package:test/test.dart';

import '../routes/_middleware.dart';

class _MockRequestContext extends Mock implements RequestContext {}

void main() {
  final context = _MockRequestContext();
  final request = Request.get(Uri.parse('http://localhost/'));
  var state = State(images: <Image>[]);

  when(() => context.request).thenReturn(request);

  group('GIVEN a middleware', () {
    final handler = middleware(
      (context) {
        state = context.read<State>();
        return Response();
      },
    );

    group('WHEN a request to <send_images> is triggerd', () {
      test('THEN it returns a valid state', () async {
        await handler(context);
        expect(state.images.length, equals(0));
      });
    });
  });
}
