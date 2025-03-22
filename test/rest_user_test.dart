import 'package:flutter_test/flutter_test.dart';
import 'package:user_http_test/model_user.dart';
import 'package:user_http_test/rest_user.dart';

void main() {
  late RESTUser restUser;

  setUp(() {
    restUser = RESTUser();
  });

  group('RESTUser - ', () {
    group('getUser function - ', () {
      test(
        'given RESTUser class when getUser function is called and status code is 200 then a ModelUser should be returned',
        () async {
          final user = await restUser.getUser();
          expect(user, isA<ModelUser>());
        },
      );

      test(
        'given RESTUser class when getUser function is called and status code is not 200 then an Exception should be thrown',
        () async {
          final user = await restUser.getUser();
          expect(user, throwsException);
        },
      );
    });
  });
}
