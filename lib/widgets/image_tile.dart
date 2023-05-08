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
    return Card(
      elevation: 5,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.green.withAlpha(30),
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