import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';

import 'controls_widget.dart';

class ThreeDModel extends StatefulWidget {
  const ThreeDModel({super.key});

  @override
  _ThreeDModelState createState() => _ThreeDModelState();
}

class _ThreeDModelState extends State<ThreeDModel> {
  final O3DController _controllerLeft = O3DController();
  final O3DController _controllerRight = O3DController();
  String? animationName;

  bool isCameraAccesible = false;

  void toggleCameraControls() {
    setState(() {
      isCameraAccesible = !isCameraAccesible;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    animationName = 'F_Walk_003';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Row(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width / 2,
              child: O3D(
                controller: _controllerLeft,
                exposure: 1.2,
                shadowIntensity: 1,
                environmentImage: 'neutral',
                skyboxImage:
                    "https://modelviewer.dev/shared-assets/environments/moon_1k.hdr",
                cameraControls:
                    isCameraAccesible, //can't control animation by touch
                src: "assets/images/jump_mode.glb",
                // autoPlay: true,
                // autoRotate: true,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width / 2,
              child: O3D(
                controller: _controllerRight,
                exposure: 1.2,
                shadowIntensity: 1,
                environmentImage: 'neutral',
                skyboxImage:
                    "https://modelviewer.dev/shared-assets/environments/moon_1k.hdr",
                cameraControls:
                    isCameraAccesible, //can't control animation by touch
                src: "assets/images/moon_walk.glb",
                animationName: animationName,
                // autoPlay: true,
                // autoRotate: true,
              ),
            ),
          ],
        ),

        // All Controls and animations
        ControlsWidget(
          controllerLeft: _controllerLeft,
          controllerRight: _controllerRight,
          toggleCameraControls: toggleCameraControls,
        ),
      ],
    );
  }
}
