import 'package:flutter/material.dart';
import 'package:untitled/model/model.dart';
import 'package:untitled/project3/Policy.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PolicySectionModel> policySections = [
      PolicySectionModel(
        icon: Icons.info_outline,
        iconColor: Colors.blue,

        title: '1. Information We Collect',
        items: [
          PolicyItem(
            text: 'Personal Data: Name, email address, etc.',
            icon: Icons.check_circle,
            iconColor: Colors.green,
          ),
          PolicyItem(
            text: 'Usage Data: Information on how you use the app.',
            icon: Icons.check_circle,
            iconColor: Colors.green,
          ),
          PolicyItem(
            text: 'Device Info: IP address, browser type, etc.',
            icon: Icons.check_circle,
            iconColor: Colors.green,
          ),
        ],
      ),
      PolicySectionModel(
        icon: Icons.recycling,
        iconColor: Colors.green,
        title: '2. How We Use Information',
        items: [
          PolicyItem(
            text: 'To provide and maintain our service.',
            icon: Icons.arrow_forward,
            iconColor: Colors.green,
          ),
          PolicyItem(
            text: 'To notify you about changes to our service.',
            icon: Icons.arrow_forward,
            iconColor: Colors.green,
          ),
          PolicyItem(
            text: 'To provide customer support.',
            icon: Icons.arrow_forward,
            iconColor: Colors.green,
          ),
        ],
      ),
      PolicySectionModel(
        icon: Icons.share_outlined,
        iconColor: Colors.purple,
        title: '3. Data Sharing',
        items: [
          PolicyItem(
            text: 'We do not sell your personal data.',
            icon: Icons.circle,
            iconColor: Colors.purple,
          ),
          PolicyItem(
            text: 'We may share data with service providers.',
            icon: Icons.circle,
            iconColor: Colors.purple,
          ),
        ],
      ),
      PolicySectionModel(
        icon: Icons.security_outlined,
        iconColor: Colors.orange,
        title: '4. Security Measures',
        items: [
          // تم إزالة الأيقونات هنا عن طريق تمرير null
          PolicyItem(
            text: 'We use industry-standard encryption (SSL/TLS)',
            icon: Icons.check_circle,
            iconColor: Colors.transparent,
          ),
          PolicyItem(
            text:
                'Protect data transmission. Your medical records are stored securely.',
            icon: Icons.check_circle,
            iconColor: Colors.transparent,
          ),
          PolicyItem(
            text:
                'Stored in HIPAA-compliant cloud databases with strict access controls.',
            icon: Icons.check_circle,
            iconColor: Colors.transparent,
          ),
          PolicyItem(
            text:
                'However, no method of transmission over the internet is 100% secure.',
            icon: Icons.check_circle,
            iconColor: Colors.transparent,
          ),
        ],
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // الجزء العلوي (Header)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 60,
                bottom: 30,
                left: 20,
                right: 20,
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF81D4FA), Color(0xFF448AFF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: const [
                  Text(
                    'Privacy Policy',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'We value your privacy and are committed to protecting your personal data.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your Privacy Matters',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'This policy explains how we collect, use, and safeguard your information when you use our services.',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  const SizedBox(height: 20),

                  // عرض الأقسام الأساسية
                  ...policySections.map((section) => Policy(section: section)),

                  const SizedBox(height: 20),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE0E4E8),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text('🍪', style: TextStyle(fontSize: 20)),
                            SizedBox(width: 8),
                            Text(
                              'Cookie Policy',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'We use cookies to enhance your experience, remember your preferences, and analyze site traffic. You can choose to disable cookies through your browser settings, though some features of the site may not function properly.',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black87,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  Center(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Contact Privacy Team'),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
