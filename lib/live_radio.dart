import 'package:flutter/material.dart';

import 'audio_service.dart';

class LiveRadioScreen extends StatefulWidget {
  const LiveRadioScreen({super.key});

  @override
  _LiveRadioScreenState createState() => _LiveRadioScreenState();
}

class _LiveRadioScreenState extends State<LiveRadioScreen> {
  final AudioService _audioService = AudioService();
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _initializeAudio();
  }

  Future<void> _initializeAudio() async {
    await _audioService.initialize();
    setState(() {
      _isPlaying = _audioService.isPlaying;
    });
  }

  void _togglePlayPause() async {
    if (_isPlaying) {
      await _audioService.pause();
    } else {
      await _audioService.play();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sure 97.5 FM"),
        backgroundColor: const Color(0xFFFFD700),
        foregroundColor: Color(0xFF800020),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Color(0xFF800020), // Wine color background fixed
              padding: const EdgeInsets.all(20),
              child: Image.asset("assets/logo.png", width: 150),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
              label: Text(_isPlaying ? "Pause" : "Play"),
              onPressed: _togglePlayPause,
            ),
          ],
        ),
      ),
    );
  }
}
