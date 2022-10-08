import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:get/get.dart';

class ScribeController extends GetxController {
  final FlutterTts flutterTts = FlutterTts();
  final textEditingController = TextEditingController().obs;
  late stt.SpeechToText _speech;
  final _isListening = false.obs;

  @override
  void onInit() {
    super.onInit();
    _speech = stt.SpeechToText();
    
  }

  speak(String text) async {
    await flutterTts.setLanguage("en-IN");
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(2);
    await flutterTts.speak(text);
  }
}
