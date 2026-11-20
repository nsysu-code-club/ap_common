import 'package:ap_common/ap_common.dart';
import 'package:ap_common_example/config/constants.dart';
import 'package:ap_common_example/res/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  static const String routerName = '/login';

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  bool? isRememberPassword = true;
  bool? isAutoLogin = false;

  int gravity = Toast.bottom;

  @override
  void initState() {
    _getPreference();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoginScaffold(
      logoMode: LogoMode.image,
      logoSource: ImageAssets.K,
      forms: <Widget>[
        ApTextField(
          controller: _username,
          keyboardType: TextInputType.emailAddress,
          focusNode: usernameFocusNode,
          nextFocusNode: passwordFocusNode,
          labelText: context.ap.studentId,
          autofillHints: const <String>[AutofillHints.username],
        ),
        ApTextField(
          obscureText: true,
          textInputAction: TextInputAction.send,
          controller: _password,
          focusNode: passwordFocusNode,
          onSubmitted: (String text) {
            passwordFocusNode.unfocus();
            _login();
          },
          labelText: context.ap.password,
          autofillHints: const <String>[AutofillHints.password],
        ),
        const SizedBox(height: 8.0),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 8,
          children: <Widget>[
            TextCheckBox(
              text: context.ap.autoLogin,
              value: isAutoLogin!,
              onChanged: _onAutoLoginChanged,
            ),
            TextCheckBox(
              text: context.ap.rememberPassword,
              value: isRememberPassword!,
              onChanged: _onRememberPasswordChanged,
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        ApButton(
          text: context.ap.login,
          onPressed: () {
            _login();
          },
        ),
        ApFlatButton(
          text: context.ap.offlineLogin,
          onPressed: _offlineLogin,
        ),
//        ApFlatButton(
//          text: ap.searchUsername,
//          onPressed: () async {
//            var username = await Navigator.push(
//              context,
//              CupertinoPageRoute(
//                builder: (_) => SearchStudentIdPage(),
//              ),
//            );
//            if (username != null && username is String) {
//              setState(() {
//                _username.text = username;
//              });
//              UiUtil.instance.showToast(context, ap.firstLoginHint);
//            }
//          },
//        )
      ],
    );
  }

  Future<void> _onRememberPasswordChanged(bool? value) async {
    setState(() {
      isRememberPassword = value;
      if (!isRememberPassword!) isAutoLogin = false;
      PreferenceUtil.instance.setBool(Constants.PREF_AUTO_LOGIN, isAutoLogin!);
      PreferenceUtil.instance.setBool(
        Constants.PREF_REMEMBER_PASSWORD,
        isRememberPassword!,
      );
    });
  }

  Future<void> _onAutoLoginChanged(bool? value) async {
    setState(() {
      isAutoLogin = value;
      isRememberPassword = isAutoLogin;
      PreferenceUtil.instance.setBool(Constants.PREF_AUTO_LOGIN, isAutoLogin!);
      PreferenceUtil.instance.setBool(
        Constants.PREF_REMEMBER_PASSWORD,
        isRememberPassword!,
      );
    });
  }

  Future<void> _getPreference() async {
    isRememberPassword =
        PreferenceUtil.instance.getBool(Constants.PREF_REMEMBER_PASSWORD, true);
    isAutoLogin =
        PreferenceUtil.instance.getBool(Constants.PREF_AUTO_LOGIN, false);
    setState(() {
      _username.text =
          PreferenceUtil.instance.getString(Constants.PREF_USERNAME, '');
      _password.text = isRememberPassword!
          ? PreferenceUtil.instance
              .getStringSecurity(Constants.PREF_PASSWORD, '')
          : '';
    });
  }

  Future<void> _login() async {
    if (_username.text.isEmpty || _password.text.isEmpty) {
      UiUtil.instance.showToast(
        context,
        context.ap.doNotEmpty,
        gravity: gravity,
      );
    } else {
      asyncLogin();
    }
  }

  void asyncLogin() {
    showDialog(
      context: context,
      builder: (BuildContext context) => PopScope(
        canPop: false,
        child: ProgressDialog(context.ap.logining),
      ),
      barrierDismissible: false,
    );
    PreferenceUtil.instance.setString(Constants.PREF_USERNAME, _username.text);
    Navigator.of(context, rootNavigator: true).pop();
    PreferenceUtil.instance.setString(Constants.PREF_USERNAME, _username.text);
    if (isRememberPassword!) {
      PreferenceUtil.instance
          .setStringSecurity(Constants.PREF_PASSWORD, _password.text);
    }
    PreferenceUtil.instance.setBool(Constants.PREF_IS_OFFLINE_LOGIN, false);
    TextInput.finishAutofillContext();
    Navigator.of(context).pop(true);
  }

  Future<void> _offlineLogin() async {
    final String username =
        PreferenceUtil.instance.getString(Constants.PREF_USERNAME, '');
    final String password =
        PreferenceUtil.instance.getStringSecurity(Constants.PREF_PASSWORD, '');
    if (username.isEmpty || password.isEmpty) {
      UiUtil.instance.showToast(context, context.ap.noOfflineLoginData);
    } else {
      if (username != _username.text || password != _password.text) {
        UiUtil.instance.showToast(
          context,
          context.ap.offlineLoginPasswordError,
        );
      } else {
        PreferenceUtil.instance.setBool(Constants.PREF_IS_OFFLINE_LOGIN, true);
        UiUtil.instance.showToast(context, context.ap.loadOfflineData);
        Navigator.of(context).pop(true);
      }
    }
  }

  Future<void> clearSetting() async {
    PreferenceUtil.instance.setBool(Constants.PREF_AUTO_LOGIN, false);
    setState(() {
      isAutoLogin = false;
    });
  }
}
