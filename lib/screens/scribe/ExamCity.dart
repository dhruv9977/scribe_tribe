import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scribetribe/components/constants/route_helper.dart';
import 'package:scribetribe/components/constants/size_config.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../../../../components/constants/colors.dart';
import '../../../../components/widgets/app_name_widgets.dart';
import '../../../../components/widgets/normal_text_widget.dart';
import '../../../components/widgets/rounded_buttons.dart';
import '../../../components/widgets/text_form_field.dart';
import '../../controllers/studen_exam_details.dart';

class ExamCity extends StatefulWidget {
  const ExamCity({Key? key}) : super(key: key);

  @override
  State<ExamCity> createState() => _ExamCityState();
}

class _ExamCityState extends State<ExamCity> {
  final FlutterTts flutterTts = FlutterTts();
  // final TextEditingController textEditingController = TextEditingController();
  late stt.SpeechToText _speech;
  // bool _isListening = false;
  double _confidence = 1.0;
  final controller = Get.find<StudentExamDetailsController>();

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    speak();
  }

  speak() async {
    await flutterTts.setLanguage("en-IN");
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(0.4);
    await flutterTts.speak(
      "Please Tell us your exam center city",
    );
    await flutterTts.awaitSpeakCompletion(true);
    await flutterTts.stop();
    _speech.isNotListening ? _listen() : _stopListener();
  }

  void _listen() async {
    await _speech.initialize();

    await _speech.listen(
      onResult: (val) => setState(() {
        controller.examCityController.value.text = val.recognizedWords;
        if (val.hasConfidenceRating && val.confidence > 0) {
          _confidence = val.confidence;
        }
      }),
    );
  }

  void _stopListener() async {
    await _speech.stop();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: GestureDetector(
        onLongPress: () {
          speak();
        },
        onDoubleTap: () {
          _speech.isNotListening ? _listen() : _stopListener();
        },
        child: Scaffold(
          body: SafeArea(
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
                    text: 'Enter City of Exam',
                    color: Colors.black,
                    txtSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  buildSizeHeight(height: 57),
                  buildTextFormField(
                    controller: controller.examCityController.value,
                    keyboardType: TextInputType.text,
                    hintText: '',
                    errorText: '',
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
                        Get.toNamed(
                          RouteHelper.getStudentExamAreaScreen(),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
