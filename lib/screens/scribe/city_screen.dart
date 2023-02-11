import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scribetribe/components/constants/route_helper.dart';
import 'package:scribetribe/components/constants/size_config.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:scribetribe/components/widgets/text_form_field.dart';
import 'package:scribetribe/controllers/studet_details_controller.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../../../../components/constants/colors.dart';
import '../../../../components/widgets/app_name_widgets.dart';
import '../../../../components/widgets/normal_text_widget.dart';
import '../../../components/widgets/rounded_buttons.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  final FlutterTts flutterTts = FlutterTts();
  late stt.SpeechToText _speech;
  // bool _isListening = false;
  double _confidence = 1.0;
  final controller = Get.find<StudentDetailsController>();

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    speak("Please Tell us Your city");
  }

  speak(String text) async {
    await flutterTts.setLanguage("en-IN");
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(0.6);
    await flutterTts.speak(
      text,
    );
    await flutterTts.awaitSpeakCompletion(true);
    await flutterTts.stop();
    _speech.isNotListening ? _listen() : _stopListener();
  }

  void _listen() async {
    await _speech.initialize();

    await _speech.listen(
      listenFor: const Duration(
        seconds: 3,
      ),
      onResult: (val) => setState(
        () async {
          controller.cityController.value.text = val.recognizedWords;
          // await _speech.stop();
          // speak("Validation ${controller.cityController.value.text}");
          // _speech.isNotListening ? _listen() : _stopListener();
        },
      ),
    );
  }

  // void isValid() async {}

  void _stopListener() async {
    await _speech.stop();
    // verification
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: GestureDetector(
        onLongPress: () {
          speak("Please Tell us Your city");
        },
        onDoubleTap: () {
          _speech.isNotListening ? _listen() : _stopListener();
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(26)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(child: appNameWidget()),
                  buildSizeHeight(height: 147),
                  buildText(
                    text: 'What is your city?',
                    color: Colors.black,
                    txtSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  buildSizeHeight(height: 57),
                  buildTextFormField(
                    controller: controller.cityController.value,
                    keyboardType: TextInputType.text,
                    hintText: 'Enter the city',
                    errorText: 'Please enter the city',
                    isSuffixIconVisible: true,
                    suffixIcon:
                        _speech.isNotListening ? Icons.mic_none : Icons.mic,
                    onIconPressed: () {
                      _speech.isNotListening ? _listen() : _stopListener();
                    },
                  ),
                  buildSizeHeight(height: 65),
                  RoundedButton(
                    text: "Next",
                    btnColor: AppColors.kPrimaryColor,
                    width: double.infinity,
                    height: 51,
                    onPressed: () {
                      // if (controller.formKey.currentState!.validate()) {
                      Get.toNamed(
                        RouteHelper.getStudentStateScreen(),
                      );
                      // }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
