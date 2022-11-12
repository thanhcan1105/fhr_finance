import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ykapay/app/controllers/verify_account_controller.dart';
import 'package:ykapay/main.dart';

class CameraApp extends StatefulWidget {
  /// Default Constructor
  const CameraApp({Key? key}) : super(key: key);

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('User denied camera access.');
            break;
          default:
            print('Handle other errors.');
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    VerifyAccountController verifyController =
        Get.put(VerifyAccountController());
    final size = MediaQuery.of(context).size;
    if (!controller.value.isInitialized) {
      return Container();
    }
    return CameraPreview(
      controller,
      child: Stack(
        children: [
          Container(
            height: size.height * 0.32,
            width: size.width,
            color: Color.fromARGB(200, 0, 0, 0),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: size.height * 0.32,
              width: size.width,
              color: Color.fromARGB(200, 0, 0, 0),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 40,
            child: GestureDetector(
              onTap: () async {
                try {
                  final image1 = await controller.takePicture();
                  verifyController.backsideCardId.value = image1.path;
                  Navigator.pop(context);
                  // If the picture was taken, display it on a new screen.
                  // await Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => DisplayPictureScreen(
                  //       // Pass the automatically generated path to
                  //       // the DisplayPictureScreen widget.
                  //       imagePath: image.path,
                  //     ),
                  //   ),
                  // );
                } catch (e) {
                  // If an error occurs, log the error to the console.
                  print(e);
                }
              },
              child: Container(
                height: size.height * 0.1,
                width: size.width * 0.1,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  // color: Colors.white,
                  border: Border.all(color: Colors.white, width: 2),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  height: size.height * 0.15,
                  width: size.width * 0.15,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
