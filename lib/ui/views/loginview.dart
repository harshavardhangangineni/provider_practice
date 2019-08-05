import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/common/helpers.dart';
import 'package:provider_example/core/view_models/LognModel.dart';
import 'package:provider_example/ui/shared/AppColors.dart';
import 'package:provider_example/ui/views/baseview.dart';
import 'package:provider_example/ui/widgets/LoginHeader.dart';
import '../../locator.dart';

class LoginView extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginModel>(
      builder: (context) => locator<LoginModel>(),
      child: BaseView<LoginModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: backgroundColor,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              LoginHeader(controller: controller),
              model.state == ViewStates.busy
                  ? CircularProgressIndicator()
                  : FlatButton(
                      color: Colors.black26,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Text(
                        'Check',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () async {
                        var loginSuccess = await model.login(controller.text);
                        if (loginSuccess) {
                          // Navigate to the home view
                        }
                      },
                    )
            ],
          ),
        ),
      ),
    );
  }
}
