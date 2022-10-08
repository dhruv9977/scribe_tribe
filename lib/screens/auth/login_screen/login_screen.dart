import 'package:flutter/material.dart';
import 'package:scribetribe/components/constants/size_config.dart';

import 'components/body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Body(),
      ),
    );
  }
}
