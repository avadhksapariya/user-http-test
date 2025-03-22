import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:user_http_test/model_user.dart';
import 'package:user_http_test/rest_user.dart';

class MockHTTPClient extends Mock implements Client {}

void main() {
  late RESTUser restUser;
  late MockHTTPClient mockHTTPClient;

  setUp(() {
    mockHTTPClient = MockHTTPClient();
    restUser = RESTUser(mockHTTPClient);
  });

  group('RESTUser - ', () {
    group('getUser function - ', () {
      test(
        'given RESTUser class when getUser function is called and status code is 200 then a ModelUser should be returned',
        () async {
          // Arrange
          when(() => mockHTTPClient.get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'))).thenAnswer(
            (invocation) async {
              return Response('''
              {
                "id": 1,
                "name": "Leanne Graham",
                "username": "Bret",
                "email": "Sincere@april.biz",
                "phone": "1-770-736-8031 x56442",
                "website": "hildegard.org"
              }
              ''', 200);
            },
          );
          // Act
          final user = await restUser.getUser();
          // Assert
          expect(user, isA<ModelUser>());
        },
      );

      test(
        'given RESTUser class when getUser function is called and status code is not 200 then null should be returned',
        () async {
          // Arrange
          when(() => mockHTTPClient.get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'))).thenAnswer(
            (invocation) async => Response('{}', 500),
          );
          // Act
          final user = await restUser.getUser();
          // Assert
          expect(user, isNull);
        },
      );
    });
  });
}
