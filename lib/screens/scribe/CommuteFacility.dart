import 'package:flutter/material.dart';
import 'package:scribetribe/components/constants/size_config.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:scribetribe/components/widgets/text_form_field.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../../../../components/constants/colors.dart';
import '../../../../components/widgets/app_name_widgets.dart';
import '../../../../components/widgets/normal_text_widget.dart';
import '../../../components/widgets/rounded_buttons.dart';

class CommuteFacilities extends StatefulWidget {
  const CommuteFacilities({Key? key}) : super(key: key);

  @override
  State<CommuteFacilities> createState() => _CommuteFacilitiesState();
}

class _CommuteFacilitiesState extends State<CommuteFacilities> {

  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController textEditingController = TextEditingController();
  late stt.SpeechToText _speech;
  bool _isListening = false;
  double _confidence = 1.0;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    speak();
  }

  speak() async{
    await flutterTts.setLanguage("en-IN");
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(0.4);
    await flutterTts.speak("Can you provide any commute facility for writer?");
  }

  void _listen()async {
    if(!_isListening){
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if(available){
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            textEditingController.text = val.recognizedWords;
            if(val.hasConfidenceRating && val.confidence > 0){
              _confidence  = val.confidence;
            }
          }),
        );
      }
    }else{
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: GestureDetector(
        onDoubleTap: () {
          _listen();
        },
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(26)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(child: appNameWidget()),
                  buildSizeHeight(height: 147),
                  buildText(
                    text: 'Can You Provide Commute Facility?',
                    color: Colors.black,
                    txtSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  buildSizeHeight(height: 57),
                  buildTextFormField(
                    controller: textEditingController,
                    keyboardType: TextInputType.text,
                    hintText: '',
                    errorText: '',
                    isSuffixIconVisible: true,
                    suffixIcon: (_isListening ? Icons.mic : Icons.mic_none),
                    onIconPressed: () {
                      _listen();
                    },
                  ),
                  buildSizeHeight(height: 65),
                  RoundedButton(
                    text: "Next",
                    btnColor: AppColors.kPrimaryColor,
                    width: double.infinity,
                    height: 51,
                    onPressed: (){
                      
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