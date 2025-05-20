import 'package:card_scanner/utils/export.dart';

class CardDetail extends StatefulWidget {
  final CardInfoVO cardInfoVo;
  const CardDetail({super.key, required this.cardInfoVo});

  @override
  State<CardDetail> createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
  Uint8List? imageBytes;

  @override
  void initState() {
    getImeageString();
    super.initState();
  }

  getImeageString() {
    imageBytes = base64Decode(widget.cardInfoVo.imageString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CardDetailView'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            imageBytes != null
                ? Image.memory(
                    imageBytes!,
                    width: 200, // Adjust width as needed
                    height: 200, // Adjust height as needed
                    fit: BoxFit.cover, // Adjust fit as needed
                  )
                : const Text('No image to display'), // Fallback if no image
            const SizedBox(height: 20),
            Text("Name: ${widget.cardInfoVo.name}"),
            Text("Designation: ${widget.cardInfoVo.designation}"),
            Text("Email: ${widget.cardInfoVo.secondaryEmail}"),
            Text("Email: ${widget.cardInfoVo.primaryEmail}"),
            Text("Phone: ${widget.cardInfoVo.number}"),
            Text("Phone: ${widget.cardInfoVo.secondaryNumber}"),
            Text("Website: ${widget.cardInfoVo.website}"),
            Text("companyName: ${widget.cardInfoVo.companyName}"),
          ],
        ));
  }
}
