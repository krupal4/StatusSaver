import '../common.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  LoadingState createState() => LoadingState();
}

class LoadingState extends State<Loading> with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                backgroundColor: Colors.white,
                valueColor: animationController.drive(ColorTween(
                    begin: Colors.blueAccent, end: Colors.greenAccent)),
              ),
              Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text("Wait app is getting ready!")),
            ],
          ),
        ),
      ),
    );
  }
}
