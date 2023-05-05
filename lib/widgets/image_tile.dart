import 'dart:io';

import 'package:status_saver/colors.dart';
import 'package:status_saver/common.dart';
import 'package:status_saver/screens/image_view.dart';
import 'package:status_saver/styles.dart';

class ImageTile extends StatelessWidget {
  const ImageTile({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: edgeinsetsAll,
      decoration: BoxDecoration(
        borderRadius: statusBorderRadius,
        color: statusBorderColor,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return ImageView(imagePath: imagePath,);
          }));
        },
        child: Image.file(
          File(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}