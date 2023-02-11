import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:scribetribe/components/constants/colors.dart';
import 'package:scribetribe/components/constants/route_helper.dart';
import 'package:scribetribe/components/constants/size_config.dart';
import 'package:scribetribe/components/widgets/normal_text_widget.dart';
import 'package:scribetribe/components/widgets/rounded_buttons.dart';
import 'package:scribetribe/controllers/tribe_details_controller.dart';

import '../../../../components/widgets/app_name_widgets.dart';
import '../../../../components/widgets/outlined_rounded_button.dart';
import 'registration_fields.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  LocationData? currentLocation;
  String address = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(26),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              appNameWidget(),
              buildSizeHeight(height: 46),
              buildText(
                text: "Tell us about yourself",
                color: AppColors.kPrimaryColor,
                txtSize: 24,
                fontWeight: FontWeight.w700,
              ),
              buildSizeHeight(height: 37),
              const RegistrationFields(),
              buildSizeHeight(height: 51),
              OutlinedRoundedButton(
                onPressed: () {
                  _buildGetLocation().then((value) {
                    setState(() {
                      currentLocation = value;
                      if (currentLocation != null) {
                        // create candidate
                        // CreateCandidateController controller =
                        //     Get.find<CreateCandidateController>();

                        // controller.latitude.value =
                        //     currentLocation!.latitude.toString();
                        // controller.longitude.value =
                        //     currentLocation!.longitude.toString();

                        // controller.createCandidateInfo();
                      }
                    });
                  });
                },
              ),
              buildSizeHeight(height: 13),
              GetBuilder<TribeDetailsController>(
                builder: (controller) {
                  return RoundedButton(
                    text: "Next",
                    btnColor: AppColors.kPrimaryColor,
                    width: double.infinity,
                    height: 51,
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.onPressed(context);
                      }
                    },
                  );
                },
              ),
              buildSizeHeight(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  Future<LocationData?> _buildGetLocation() async {
    Location location = Location();
    LocationData locationData;

    bool isServiceEnabled;

    PermissionStatus permissionGranted;

    isServiceEnabled = await location.serviceEnabled();

    if (!isServiceEnabled) {
      isServiceEnabled = await location.requestService();
      if (!isServiceEnabled) {
        return null;
      }
    }

    permissionGranted = await location.hasPermission();

    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    locationData = await location.getLocation();
    return locationData;
  }

  // getUserLocation() async {
  //   //call this async method from whereever you need

  //   LocationData? myLocation;
  //   String error;
  //   Location location = new Location();
  //   try {
  //     myLocation = await location.getLocation();
  //   } on PlatformException catch (e) {
  //     if (e.code == 'PERMISSION_DENIED') {
  //       error = 'please grant permission';
  //       print(error);
  //     }
  //     if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
  //       error = 'permission denied- please enable it from app settings';
  //       print(error);
  //     }
  //     myLocation = null;
  //   }
  //   currentLocation = myLocation;
  //   final coordinates =
  //       new Coordinates(myLocation!.latitude, myLocation.longitude);
  //   var addresses =
  //       await Geocoder.local.findAddressesFromCoordinates(coordinates);
  //   var first = addresses.first;
  //   print(
  //       ' ${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}');
  //   return first;
  // }
}
