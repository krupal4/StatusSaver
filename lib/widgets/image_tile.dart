import 'dart:io';

import 'package:status_saver/common.dart';
import 'package:status_saver/screens/image_view.dart';

class ImageTile extends StatelessWidget {
  const ImageTile({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.green
      ),
      child: GestureDetector(
        onTap: () {
          log('tapped');
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