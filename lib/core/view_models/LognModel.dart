import 'package:flutter/foundation.dart';
import 'package:provider_example/common/helpers.dart';
import 'package:provider_example/core/services/authentivationService.dart';
import 'package:provider_example/locator.dart';
import 'package:provider_example/ui/views/baseview.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationSerivice =
      locator<AuthenticationService>();

  ViewStates _state = ViewStates.Idle;

  ViewStates get state => _state;

  void setState(ViewStates state) {
    _state = state;
    notifyListeners();
  }

  Future<bool> login(String userId) async {
    setState(ViewStates.busy);
    var success = await _authenticationSerivice.login(int.tryParse(userId));
    setState(ViewStates.Idle);
    return success;
  }
}
