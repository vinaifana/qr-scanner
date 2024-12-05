import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qr_scanner/consts.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class QrGeneratorScreen extends StatefulWidget {
  const QrGeneratorScreen({super.key});

  @override
  State<QrGeneratorScreen> createState() => _QrGeneratorScreenState();
}

class _QrGeneratorScreenState extends State<QrGeneratorScreen> {
  String? qrRawValue;
  Color? borderColor = Colors.grey; // Bisa null untuk None
  final ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Generate QR Codes"),
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, '/home');
          },
          icon: const Icon(Icons.chevron_left_rounded),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/banner_img.png',
              width: 300,
              height: 60,
            ),
            const Text(
              "Put Your Link or Data Here \n And Share The QR Code!",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textBlue,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24.0),
            TextField(
              decoration: InputDecoration(
                labelText: "Put Your Data Here",
                labelStyle: const TextStyle(
                  color: textColor,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryColor,
                    width: 1.0,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: tertiaryColor,
                    width: 1.7,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18)
                ),
              ),
              onChanged: (value) {
                setState(() {
                  qrRawValue = value;
                });
              },
            ),
            const SizedBox(height: 10.0),
            const Text(
              "Choose Your Color :",
              style: TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.bold,
                color: textBlue
              ),
            ),
            const SizedBox(height: 14,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      borderColor = primaryColor; // Pilih warna biru
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor, // Warna tombol biru
                  ),
                  child: const Text(
                    "Blue",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      borderColor = secondaryColor; // Pilih warna hijau
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: secondaryColor, // Warna tombol hijau
                  ),
                  child: const Text(
                    "Green",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      borderColor = tertiaryColor; // Pilih warna merah
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tertiaryColor, // Warna tombol merah
                  ),
                  child: const Text(
                    "Yellow",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      borderColor = null; 
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, 
                  ),
                  child: const Text(
                    "None",
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: defaultPadding,),
            if (qrRawValue != null)
              Screenshot(
                controller: screenshotController,
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: borderColor != null
                        ? Border.all(
                            color: borderColor!, 
                            width: 3,
                          )
                        : null, 
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8.0,
                        offset: const Offset(2, 4),
                      ),
                    ],
                  ),
                  child: SizedBox(
                    width: 230,
                    height: 230,
                    child: PrettyQrView.data(
                      data: qrRawValue!,
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 16.0),
            if (qrRawValue != null)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () async {
                      final image = await screenshotController.capture();
                      if (image != null) {
                        Share.shareXFiles([XFile.fromData(image)], text: 'Check out my QR Code!');
                      }
                    },
                    icon: const Icon(Icons.share),
                    label: const Text(
                      "Share",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      iconColor: Colors.white,
                      minimumSize: const Size(30, 40)
                    ),
                  ),

                  const SizedBox(height: 8),
                  ElevatedButton.icon(
                    onPressed: () async {
                      final image = await screenshotController.capture();
                      if (image != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Screenshot saved successfully!")),
                        );
                      }
                    },
                    icon: const Icon(Icons.camera_alt),
                    label: const Text(
                      "Screenshot",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      iconColor: Colors.white,
                      minimumSize: const Size(30, 40)
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
