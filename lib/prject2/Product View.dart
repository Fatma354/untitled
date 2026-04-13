import 'package:flutter/material.dart';
import 'package:untitled/prject2/MoreProducts.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/logo-cycle 2.png", height: 30),
            const SizedBox(width: 8),
            Image.asset("assets/Suger_Wise_Logo 2.png", height: 30),
          ],
        ),
        actions: const [
          Icon(Icons.menu, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey.shade200,
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/WhatsApp Image 2026-03-02 at 5.45.01 PM 1.png",
                        height: 150,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      4,
                      (index) => Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(
                          "assets/WhatsApp Image 2026-03-02 at 5.45.01 PM 1.png",
                          height: 40,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        const Text(
                          "Accu-Chek Instant",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.star, color: Colors.orange, size: 18),
                        const Icon(Icons.star, color: Colors.orange, size: 18),
                        const Icon(Icons.star, color: Colors.orange, size: 18),
                        const Icon(Icons.star, color: Colors.orange, size: 18),
                        const Icon(
                          Icons.star_half,
                          color: Colors.orange,
                          size: 18,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "(4.9/5)",
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "\$45",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Instant clarity, instant confidence. Wireless connection to your phone.",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),

                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.flash_on, size: 20),
                          label: const Text(
                            "Buy Now",
                            style: TextStyle(
                              fontWeight: FontWeight.bold, // خط تقيل
                              fontSize: 16,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2563EB),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.shopping_cart,
                            color: Color(0xFF2563EB),
                            size: 20,
                          ),
                          label: const Text(
                            "Add to cart",
                            style: TextStyle(
                              color: Color(0xFF2563EB),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF1F7FA),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.local_shipping,
                            size: 18,
                            color: Colors.lightBlue,
                          ),
                          SizedBox(width: 5),
                          Text("Delivery: 2-3 Days"),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.verified,
                            size: 18,
                            color: Colors.greenAccent,
                          ),
                          SizedBox(width: 5),
                          Text("Medical Grade"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            MoreProduct(),
          ],
        ),
      ),
    );
  }
}
