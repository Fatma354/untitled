import 'package:flutter/material.dart';

class Terms extends StatelessWidget {
  const Terms({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF1E74BB);
    const backgroundGray = Color(0xFFF5F5F5);
    const textDark = Color(0xFF2F4C5B);
    const textBody = Color(0xFF677681);
    const warningRed = Color(0xFFE57373);
    const warningBg = Color(0xFFFFF1F1);

    Widget text(String message, {bool isBold = false}) => Padding(
      padding: EdgeInsets.only(top: isBold ? 12 : 8, left: 5),
      child: Text(
        message,
        style: TextStyle(
          fontSize: 13,
          fontWeight: isBold ? FontWeight.bold : null,
          color: isBold ? textDark : textBody,
          height: 1.5,
        ),
      ),
    );

    Widget list(List<String> items, {IconData icon = Icons.circle, Color color = primaryBlue}) {
      final isBullet = icon == Icons.circle;
      return Column(
        children: items.map((t) => Padding(
          padding: EdgeInsets.only(top: isBullet ? 6 : 8, left: isBullet ? 15 : 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: isBullet ? 6 : 0),
                child: Icon(icon, size: isBullet ? 5 : 18, color: color),
              ),
              const SizedBox(width: 10),
              Expanded(child: Text(t, style: const TextStyle(color: textBody, fontSize: 13))),
            ],
          ),
        )).toList(),
      );
    }

    Widget section(String numStr, String titleStr, List<Widget> items, {bool isWarning = false, bool pb = true}) {
      final c = isWarning ? warningRed : primaryBlue;
      return Padding(
        padding: EdgeInsets.only(bottom: pb ? 25 : 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 8),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(color: c.withOpacity(0.1), borderRadius: BorderRadius.circular(5)),
                    child: Text(numStr, style: TextStyle(color: c, fontWeight: FontWeight.bold, fontSize: 12)),
                  ),
                  const SizedBox(width: 10),
                  Expanded(child: Text(titleStr, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textDark))),
                ],
              ),
            ),
            ...items,
          ],
        ),
      );
    }

    final header = Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      decoration: const BoxDecoration(
        color: primaryBlue,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      child: Column(
        children: [
          const Text("Terms of Service", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const Text(
            "Please read these terms carefully before using the SugarWise platform. By accessing our services, you agree to be bound by these terms.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 13, height: 1.4),
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(20)),
            child: const Text("LAST UPDATED: DECEMBER 20, 2023", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
          ),
        ],
      ),
    );

    final warningBox = Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: warningBg, borderRadius: BorderRadius.circular(8), border: Border.all(color: warningRed.withOpacity(0.3))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("SUGARWISE DOES NOT PROVIDE MEDICAL ADVICE.", style: TextStyle(color: warningRed, fontWeight: FontWeight.bold, fontSize: 12)),
          const SizedBox(height: 4),
          Text("The content provided on the platform is for informational purposes only. We are a technology platform, not a healthcare provider.", style: TextStyle(color: warningRed.withOpacity(0.9), fontSize: 11, height: 1.4)),
        ],
      ),
    );

    final contactBox = Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(color: Color(0xFFE3F2FD), borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("SugarWise Legal Team", style: TextStyle(color: textDark, fontWeight: FontWeight.bold, fontSize: 14)),
          const Text("132 Health Valley, Cairo, Egypt", style: TextStyle(color: textBody, fontSize: 12)),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: const Center(child: Text("legal@sugarwise.com", style: TextStyle(color: primaryBlue, fontWeight: FontWeight.bold, fontSize: 13))),
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: backgroundGray,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: header),
            SliverToBoxAdapter(
              child: Transform.translate(
                offset: const Offset(0, -15),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      section("1", "Acceptance of Terms", [
                        text("Welcome to SugarWise. These Terms of Service constitute a legally binding agreement between you (“User,” “Patient,” or “Doctor”) and SugarWise Inc. (“we,” “us,” or “our”)."),
                        text("By registering for an account, accessing, or using our website and mobile applications, you acknowledge that you have read, understood, and agree to be bound by these Terms and our Privacy Policy."),
                      ]),
                      section("2", "Description of Services", [
                        text("SugarWise is a digital healthcare platform that connects patients with healthcare providers. Our services include:"),
                        list([
                          "Searching for doctors, clinics, and specialists by location and specialty.",
                          "Viewing doctor profiles, availability, and consultation fees.",
                          "Booking in-person and video consultation appointments.",
                          "Managing medical history and appointment records.",
                        ]),
                      ]),
                      section("3", "Medical Disclaimer", [
                        warningBox,
                        text("Always seek the advice of your physician or qualified health provider with any questions you may have regarding a medical condition."),
                      ], isWarning: true),
                      section("4", "User Accounts", [
                        text("To access certain features, you must register for an account. You agree to:"),
                        list([
                          "Provide accurate, current, and complete information.",
                          "Maintain the security of your password.",
                          "Notify us immediately if you discover any security breach.",
                        ], icon: Icons.check_circle, color: Colors.green),
                      ]),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: Divider(color: backgroundGray),
                      ),
                      section("5", "Booking & Cancellations", [
                        text("5.1 Appointments:", isBold: true),
                        text("When you book an appointment, you agree to attend at the scheduled time. Doctors reserve the right to mark you as a “No-Show” if you are more than 15 minutes late."),
                        text("5.2 Cancellation Policy:", isBold: true),
                        text("You may cancel or reschedule an appointment up to 2 hours before the scheduled time without penalty."),
                      ]),
                      section("6", "User Conduct", [
                        text("You agree not to use the Services to:"),
                        list([
                          "Violate any local, state, or national law.",
                          "Impersonate any person or entity.",
                          "Harass, abuse, stalk, or other users.",
                          "Attempt to scrape or data mine our content.",
                        ], icon: Icons.cancel, color: warningRed),
                      ]),
                      section("7", "Termination", [
                        text("We reserve the right to suspend or terminate your account at our sole discretion, without notice, for conduct that we believe violates these Terms of Service or is harmful to other users of the Services, us, or third parties."),
                      ]),
                      section("8", "Contact Us", [
                        text("If you have any questions about these Terms, please contact us at:"),
                        const SizedBox(height: 12),
                        contactBox,
                      ], pb: false),
                      const SizedBox(height: 30),
                      const Center(
                        child: Text(
                          "© 2024 SugarWise Inc. All rights reserved.\nProfessional Healthcare Platform",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey, fontSize: 11, height: 1.5),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
