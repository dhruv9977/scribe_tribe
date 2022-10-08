import 'package:flutter/material.dart';

import '../../../components/constants/size_config.dart';
import 'components/body.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return const SafeArea(
      child: Scaffold(
        body: Body(),
      ),
    );
  }
}


