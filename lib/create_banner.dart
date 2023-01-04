import 'package:banner_generator/routes.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();
var title = TextEditingController().toString();
var subtitle = TextEditingController().toString();
var merchantName = TextEditingController().toString();
var dateAndTime = TextEditingController().toString();
//var _title = TextEditingController().toString();
final imageController = TextEditingController();
final logoController = TextEditingController();
String imageUrl = imageController.text;
//String logoUrl = logoController.text;

class BannerInfo extends StatefulWidget {
  const BannerInfo({super.key});

  @override
  State<BannerInfo> createState() => _BannerInfoState();
}

class _BannerInfoState extends State<BannerInfo> {
  @override
  void dispose() {
    imageController.dispose();
    logoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banner'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Title'),
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
              onSaved: (value) => title = value.toString(),
            ),

            TextFormField(
              decoration: const InputDecoration(labelText: 'Merchant Name'),
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Please enter a subtitle';
                }
                return null;
              },
              onSaved: (value) => merchantName = value.toString(),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Subtitle'),
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Please enter Experts Title';
                }
                return null;
              },
              onSaved: (value) => subtitle = value.toString(),
            ),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Date and Time(25 Dec, 2 PM'),
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Please enter a subtitle';
                }
                return null;
              },
              onSaved: (value) => dateAndTime = value.toString(),
            ),
            TextFormField(
              controller: imageController,
              decoration: const InputDecoration(labelText: 'Image URL'),
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return 'Please enter Image URL';
                }
                return null;
              },
              // onSaved: (value) => imageUrl = value.toString(),
            ),
            // TextFormField(
            //   controller: logoController,
            //   decoration: const InputDecoration(labelText: 'Logo URL'),
            //   validator: (value) {
            //     if (value != null && value.isEmpty) {
            //       return 'Please enter Image URL';
            //     }
            //     return null;
            //   },
            //   //onSaved: (value) => logoUrl = value,
            // ),
            //Button to create preview
            ElevatedButton(
              onPressed: () {
                _formKey.currentState?.save();
                setState(() {});
                if (!mounted) return;
                Navigator.of(context).pushNamedAndRemoveUntil(
                  previewBannerRoute,
                  (route) => false,
                );
              },
              child: const Text('Preview'),
            ),
          ],
        ),
      ),
    );
  }
}
