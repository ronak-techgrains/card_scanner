import 'package:card_scanner/utils/export.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> with ScanScreenMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Business Card Scanner'), backgroundColor: Colors.blue),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                getImageFromCamera();
              },
              child: const Text('Scan Business Card (Camera)'),
            ),
            ElevatedButton(
              onPressed: () {
                getImageFromGallery();
              },
              child: const Text('Scan Business Card (Gallery)'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
