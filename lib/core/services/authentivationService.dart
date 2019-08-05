import 'package:provider_example/core/services/Api.dart';
import 'package:provider_example/locator.dart';

class AuthenticationService {
  API _api = locator<API>();
  Future<bool> login(int userId) async {
    var fetchedUser = await _api.getUserProfile(userId);
    var hasUser = fetchedUser != null;
    return hasUser;
  }
}
