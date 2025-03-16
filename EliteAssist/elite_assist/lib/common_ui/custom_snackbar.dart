import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  final AudioPlayer _audioPlayer = AudioPlayer();

  CustomSnackBar({required String title, required String message}) {
    _playSound();
    Get.snackbar(
      title,
      message,
      colorText: Colors.black,
      backgroundColor: Colors.grey.shade200,
    );
  }

  void _playSound() async {
    try {
      await _audioPlayer.setSource(AssetSource('audio/sound.mp3'));
      await _audioPlayer.resume();
    } catch (e) {
      print('Error playing sound: $e');
    }
  }
}
