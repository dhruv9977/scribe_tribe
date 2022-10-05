import 'package:flutter/material.dart';
import 'package:scribetribe/components/constants/size_config.dart';

import '../../../components/widgets/app_name_widgets.dart';

class ScribeDetails extends StatelessWidget {
  const ScribeDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppNameWidget(),
            
          ],
        ),
      ),
    );
  }
}

