import 'package:status_saver/common.dart';

class DrawerItem extends StatelessWidget {
  final Widget child;
  const DrawerItem({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: child,
    );
  }
}