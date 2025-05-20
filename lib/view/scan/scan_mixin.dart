import 'dart:io';

import 'package:card_scanner/main.dart';
import 'package:card_scanner/utils/export.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

mixin ScanScreenMixin<T extends StatefulWidget> on State<T> {
  final ImagePicker picker = ImagePicker();
  CardInfoVO cardInfoVo = CardInfoVO();
  String extractedText = 'Extracted text will appear here';

  var details;

  String? base64Image;

  Future<void> getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      convertImage(pickedFile);
      readTextFromImage(File(pickedFile.path));
    }
  }

  Future<void> getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      convertImage(pickedFile);
      readTextFromImage(File(pickedFile.path));
    }
  }

  Future<void> convertImage(XFile pickedFile) async {
    List<int> imageBytes = await pickedFile.readAsBytes();
    base64Image = base64Encode(imageBytes);
  }

  Future<void> readTextFromImage(File image) async {
    EasyLoading.show(status: 'Processing...');
    final inputImage = InputImage.fromFile(image);

    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

    final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);

    String text = recognizedText.text;
    EasyLoading.dismiss();

    extractedText = text;
    setState(() {});

    extractDetailsFromText(text);

    textRecognizer.close();
    EasyLoading.dismiss();
  }

  void extractDetailsFromText(String text) {
    final trimmedText = text.trim().replaceAll(" ", "");

    details = extractDetails(text);

    cardInfoVo = CardInfoVO(
        name: details['name'] ?? '',
        designation: details['designation'] ?? '',
        secondaryEmail: details['secondaryEmail'] ?? '',
        primaryEmail: details['primaryEmail'] ?? '',
        website: details['website'] ?? '',
        scanText: trimmedText,
        number: details['firstPhone'] ?? '',
        secondaryNumber: details['secondPhone'] ?? '',
        companyName: details['company'] ?? '',
        imageString: base64Image ?? '');
    logger.d(cardInfoVo.toJson());

    Navigator.push(context, MaterialPageRoute(builder: (context) => CardDetail(cardInfoVo: cardInfoVo)));

    setState(() {});
  }

  Map<String, dynamic> extractDetails(String text) {
    final textParts = text.split('\n');
    String name = '';
    String designation = '';

    String website = RegexMaster.websiteRegExp.firstMatch(text)?.group(0) ?? '';

    for (int i = 0; i < textParts.length; i++) {
      final value = textParts[i];
      if (designation.isEmpty && ListMaster.designations.contains(value)) {
        designation = value;
        if (i > 0) {
          name = textParts[i - 1];
        }
      }
    }

    final phoneMatches = RegexMaster.phoneRegex.allMatches(text.trim());
    final phones = phoneMatches.map((match) => match.group(0)!).where((phone) => phone.replaceAll(RegExp(r'[^0-9]'), '').length > 6).toList();
    List<String> emails = RegexMaster.emailRegex.allMatches(text).map((match) => match.group(0) ?? '').toList();

    final firstPhone = phones.isNotEmpty ? phones[0] : "";
    final secondPhone = phones.length > 1 ? phones[1] : "";

    final primaryEmail = emails.isNotEmpty ? emails[0] : "";
    final secondaryEmail = emails.length > 1 ? emails[1] : "";

    String address = "";

    for (String item in textParts) {
      String itemLower = item.toLowerCase();
      if (!itemLower.contains(name.toLowerCase()) &&
          !itemLower.contains(designation.toLowerCase()) &&
          !itemLower.contains(primaryEmail.toLowerCase()) &&
          !itemLower.contains(secondaryEmail.toLowerCase()) &&
          !itemLower.contains(website.toLowerCase()) &&
          !itemLower.contains(firstPhone.toLowerCase()) &&
          !itemLower.contains(secondPhone.toLowerCase())) {
        address += address.isNotEmpty ? ", ${item.trim()}" : item.trim();
      }
    }

    final companyName = RegexMaster.domainNameRegExp.firstMatch(website);

    String company = RegexMaster.domainRegExp.hasMatch(companyName!.group(1) ?? '')
        ? RegexMaster.domainRegExp.firstMatch(companyName.group(1) ?? '')?.group(1) ?? companyName.group(1) ?? ''
        : companyName.group(1) ?? '';

    return {
      'name': name,
      'designation': designation,
      'secondaryEmail': secondaryEmail,
      'primaryEmail': primaryEmail,
      'website': website,
      'firstPhone': firstPhone,
      'secondPhone': secondPhone,
      'company': company
    };
  }
}
