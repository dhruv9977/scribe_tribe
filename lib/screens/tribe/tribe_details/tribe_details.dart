import 'package:flutter/material.dart';
import 'package:scribetribe/components/constants/size_config.dart';

import 'components/body.dart';

class TribeDetails extends StatelessWidget {
  const TribeDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const SafeArea(
      child:  Scaffold(
        body: Body(),
      ),
    );
  }
}
