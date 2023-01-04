import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'create_banner.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class PreviewBannerView extends StatefulWidget {
  const PreviewBannerView({super.key});

  @override
  State<PreviewBannerView> createState() => _PreviewBannerViewState();
}

class _PreviewBannerViewState extends State<PreviewBannerView> {
  static GlobalKey previewContainer = GlobalKey();
  Uint8List? bytes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scaffold')),
      body: RepaintBoundary(
        key: previewContainer,
        child: Center(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              //color: const Color.fromARGB(255, 146, 163, 215),
              height: 500,
              width: 500,
              child: Stack(
                children: [
                  Image.asset('assets/images/file.png'),
                  Positioned(
                    top: 70,
                    left: 45,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "I am going ",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.left,
                              selectionColor:
                                  Color.fromARGB(255, 247, 245, 245),
                              textScaleFactor: 1.5,
                            ),
                            Image.asset(
                              'assets/images/live.png',
                              width: 40,
                              height: 36,
                            ),
                          ],
                        ),
                        const Text(
                          "on IndiaClan App ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                          selectionColor: Color.fromARGB(255, 247, 245, 245),
                          textScaleFactor: 1.5,
                        ),
                        const SizedBox(height: 30),
                        Text(
                          merchantName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                          selectionColor: Colors.white,
                          textScaleFactor: 2,
                        ),
                        Text(
                          subtitle,
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                          selectionColor: Colors.white,
                          textScaleFactor: 1.5,
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          "Topic: ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                          selectionColor: Colors.white,
                          textScaleFactor: 1.5,
                        ),
                        Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                          selectionColor: Colors.white,
                          textScaleFactor: 2,
                        ),
                        const SizedBox(height: 30),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            dateAndTime,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.left,
                            selectionColor: Colors.white,
                            textScaleFactor: 2,
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: Image.network(imageUrl).image,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: Colors.white,
                      ),
                      child: Image.asset(
                        'assets/images/IC_logo.png',
                        width: 120,
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: exportImage,
            child: const Text('Download Image'),
          ),
        ],
      ),
    );
  }

  exportImage() async {
    final RenderRepaintBoundary boundary = previewContainer.currentContext!
        .findRenderObject()! as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 4);
    final directory = (await getApplicationDocumentsDirectory()).path;
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List? pngBytes = byteData?.buffer.asUint8List();
    File imgFile = File('$directory/screenshot.png');
    imgFile.writeAsBytes(pngBytes!);
  }
}
