import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      print("Could not open $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Us"),
        backgroundColor: const Color(0xFFFFD700), // Golden Yellow
        foregroundColor: Color(0xFF800020),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "📍 141, Obafemi Awolowo Road,\nRadio Bus Stop, Radio Compound,\nOke Ota Ona, Itamaga, Ikorodu.",
              style: TextStyle(color: Color(0xFF800020), fontSize: 18),
            ),
            const SizedBox(height: 10),

            const SizedBox(height: 10),
            const Text(
              "📞 +234 915 333 0975 \n📞 +234 705 505 0975 \n📞 +234 915 099 0975",
              style: TextStyle(color: Color(0xFF800020), fontSize: 16),
            ),

            const Text(
              "📧 info@sure975fm.com",
              style: TextStyle(color: Color(0xFF800020), fontSize: 16),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.facebook, color: Color(0xFF800020)),
                  onPressed: () => _launchURL("https://facebook.com/sure975fm"),
                ),
                IconButton(
                  icon: const Icon(Icons.music_note, color: Color(0xFF800020)),
                  onPressed:
                      () => _launchURL("https://instagram.com/sure975fm"),
                ),
                IconButton(
                  icon: const Icon(Icons.sports, color: Color(0xFF800020)),
                  onPressed: () => _launchURL("https://twitter.com/sure975fm"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
