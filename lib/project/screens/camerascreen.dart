import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';

List<CameraDescription>? cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: CameraScreen(),
    );
  }
}

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  bool _isDetecting = false;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      cameras![1], // Use front camera
      ResolutionPreset.medium,
    );
    _controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
      _controller?.startImageStream((CameraImage img) {
        if (!_isDetecting) {
          _isDetecting = true;
          // Send frame to ML model
          runModelOnFrame(img).then((_) {
            _isDetecting = false;
          });
        }
      });
    });
    loadModel();
  }

  Future<void> loadModel() async {
    await Tflite.loadModel(
      model: "assets/model.tflite",
      labels: "assets/labels.txt",
    );
  }

  Future<void> runModelOnFrame(CameraImage img) async {
    // Run your model inference here
    // You might need to convert the CameraImage to a format suitable for your model
    // For example, converting it to a byte array or a specific input shape
  }

  @override
  void dispose() {
    _controller?.dispose();
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    if (!_controller!.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      body: CameraPreview(_controller!),
    );
  }
}
 