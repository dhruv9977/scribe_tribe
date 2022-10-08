import 'package:flutter/material.dart';

import '../../../components/constants/size_config.dart';
import 'components/body.dart';

class UserOTPScreen extends StatelessWidget {
  const UserOTPScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
      resizeToAvoidBottomInset: false,
    );
  }
}
