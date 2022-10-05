import 'package:flutter/material.dart';
import 'package:scribetribe/components/constants/colors.dart';
import 'package:scribetribe/components/constants/size_config.dart';
import 'package:scribetribe/components/widgets/normal_text_widget.dart';

import '../../../components/widgets/app_name_widgets.dart';

class TribeDetails extends StatelessWidget {
  const TribeDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            appNameWidget(),
            buildSizeHeight(height: 46),
            buildText(
              text: "Tell us about yourself",
              color: AppColors.kPrimaryColor,
              txtSize: 24,
              fontWeight: FontWeight.w700,
            )
          ],
        ),
      ),
    );
  }
}
