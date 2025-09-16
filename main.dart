import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        backgroundColor: Color(0xFFF4F4F4),
        body: Center(child: BusinessCard()),
      ),
    );
  }
}

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key});

  // 📞 Phone
  void _launchPhone() async {
    final Uri uri = Uri(scheme: 'tel', path: '+923166604576');
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  // 📧 Email
  void _launchEmail() async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: 'fatimanirmal58@gmail.com',
      query: 'subject=Business Inquiry',
    );
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  // 📍 Location
  void _launchLocation() async {
    final Uri uri =
    Uri.parse("https://www.google.com/maps?q=Sahiwal+Punjab+Pakistan");
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 440,
      height: 260,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF00695C), Color(0xFF26A69A)], // teal gradient
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(2, 4)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 👤 Profile Image on Top Center
          const CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage('assets/images/avatar.jpg'),
          ),
          const SizedBox(height: 8),

          // ✨ Name
          Text(
            'Fatima Nirmal',
            style: GoogleFonts.lobster(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),

          // Job Title
          Text(
            'Mobile App Developer',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 10),

          // 📞 Phone
          GestureDetector(
            onTap: _launchPhone,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.phone, color: Colors.white, size: 14),
                const SizedBox(width: 8),
                Text('+92 316 6604576',
                    style: GoogleFonts.poppins(color: Colors.white)),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // 📧 Email
          GestureDetector(
            onTap: _launchEmail,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.email, color: Colors.white, size: 14),
                const SizedBox(width: 8),
                Text('fatimanirmal58@gmail.com',
                    style: GoogleFonts.poppins(color: Colors.white)),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // 📍 Location
          GestureDetector(
            onTap: _launchLocation,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.location_on, color: Colors.white, size: 14),
                const SizedBox(width: 8),
                Text('Sahiwal, Punjab, Pakistan',
                    style: GoogleFonts.poppins(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
