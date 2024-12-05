
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner/consts.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left_rounded),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          }
        ),
        title: const Text(
          "Scan QR Code",     
        ),
      ),
      body: Stack(
        children: [
          // MobileScanner yang sudah lo punya
          MobileScanner(
            controller: MobileScannerController(
              detectionSpeed: DetectionSpeed.noDuplicates, // noDuplicates sekali pake sampe barcode ke scan, dan bisa scan lagi pas user kembali dari app, intinya dia gak bisa duplikasi app
              returnImage: true // Untuk mengembalikan image, which is dia bakal bawa qr code image yang dia ambil lewat camera (gambarnya ditangkap)
            ),
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes; // Untuk memberitahu bahwa hasilnya akan disimpan di variable barcode
              final Uint8List? image = capture.image; // Uint8List adalah tipe data untuk menyimpan data denga ukuran 8 byte, jadi kita memberikan batasan di ukuran image nya
              for (final barcode in barcodes) {
                print('Barcode is valid! Click the source: ${barcode.rawValue}'); // rawValue adalah code atau data mentah dari barcode
              }
              if (image != null) {
                showDialog(
                  context: context, // context repesentasi untuk halaman yang sekarang
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        barcodes.first.rawValue ?? "No refrence found from this QR Code",
                      ),
                      content: Image(
                        image: MemoryImage(image), // MemoryImage adalah decodes
                        // decodes adalah proses mengkompres size dari sebuah image sesuai aturan yang ada di Uint8List
                      ),
                    );
                  },
                );
              }
            },
          ),

          Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: Text(
                      "Point the QR Code into the box", 
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Center(
                  child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: primaryColor, 
                        width: 3
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}