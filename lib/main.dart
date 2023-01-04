import 'package:banner_generator/create_banner.dart';
import 'package:banner_generator/preview_banner.dart';
import 'package:banner_generator/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BannerGenerator());
}

class BannerGenerator extends StatelessWidget {
  const BannerGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const BannerInfo(),
      routes: {
        previewBannerRoute: (context) => const PreviewBannerView(),
      },
    );
  }
}
