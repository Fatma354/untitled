import 'package:flutter/material.dart';
import 'package:untitled/model/model.dart';

class Medical extends StatelessWidget {
  const Medical({super.key});

  final List<MedicalInfo> medicalList = const [
    MedicalInfo(
      icon: Icons.add_circle_outline,
      title: "1. No Medical Advice",
      desc:
          "The content, text, graphics, and images provided on SugarWise are for informational purposes only. The content is not intended to be a substitute for professional medical advice...",
    ),
    MedicalInfo(
      icon: Icons.people_outline,
      title: "2. No Doctor-Patient Relationship",
      desc:
          "Use of the SugarWise platform does not create a doctor-patient relationship. Such a relationship is only established when you actually visit a healthcare provider...",
    ),
    MedicalInfo(
      icon: Icons.check_circle_outline,
      title: "3. Accuracy of Provider Information",
      desc:
          "While we verify the basic credentials of doctors listed on our platform, SugarWise does not guarantee the accuracy of doctor profiles, available hours, or fees...",
    ),
    MedicalInfo(
      icon: Icons.settings_outlined,
      title: "4. Limitation of Liability",
      desc:
          "By using this service, you agree that SugarWise shall not be liable for any direct, indirect, incidental, or consequential damages resulting from the use or inability to use the service...",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF9E0039), Color(0xFF2E38B1)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Text(
                        "Medical Disclaimer",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Important information regarding the scope\nof services provided by SugarWise.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                      const SizedBox(height: 25),

                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          children: [
                            // أيقونة الطوارئ
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.red.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.medical_services,
                                color: Color(0xFFE57373),
                                size: 30,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "IN CASE OF EMERGENCY",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "If you are experiencing a medical emergency, do not use this website or application. Call your local emergency services (e.g., 123) or go to the nearest emergency room immediately.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Divider(),
                            ),

                            // استدعاء القائمة باستخدام Map
                            ...medicalList.map((info) {
                              return _buildInfoSection(
                                icon: info.icon,
                                title: info.title,
                                desc: info.desc,
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/logo.png', width: 30, height: 30),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "SugarWise",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Smart Diabetes Management",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 10,
                                ),
                              ),
                              SizedBox(height: 7),
                              Text(
                                "SugarWise is a revolutionary platform helping diabetic patients, especially children, control blood sugar levels through intelligent monitoring and food intake calculation",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text("I Understand & Return Home"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoSection({
    required IconData icon,
    required String title,
    required String desc,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF2E38B1), size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
