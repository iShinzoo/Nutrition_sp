import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(FlutterApp());
}

class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScannerPage(cameras),
    );
  }
}

class ScannerPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const ScannerPage(this.cameras);

  @override
  State<StatefulWidget> createState() => ScannerState();
}

class ScannerState extends State<ScannerPage> {
  CameraController? controller;
  bool isCameraInitialized = false;

  void initializeCamera() {
    controller = CameraController(widget.cameras[0], ResolutionPreset.medium);
    controller!.initialize().then((_) {
      if (!mounted) return;
      setState(() {
        isCameraInitialized = true;
      });
    });
  }

  Future<void> pickImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      await saveAndUploadImage(File(pickedFile.path));
    }
  }

  Future<void> captureImage() async {
    if (controller != null && controller!.value.isInitialized) {
      final image = await controller!.takePicture();
      await saveAndUploadImage(File(image.path));
    }
  }

  Future<void> saveAndUploadImage(File image) async {
    try {
      // Create a specific directory if it doesn't exist
      final directory = await getApplicationDocumentsDirectory();
      final imagePath = '${directory.path}/gemini/images/image.jpg';

      // Create the 'gemini/images' folder structure
      final folder = Directory('${directory.path}/gemini/images');
      if (!await folder.exists()) {
        await folder.create(recursive: true);
      }

      // Save the image to the folder with a fixed filename
      final savedImage = await image.copy(imagePath);

      // Upload the image to the backend
      await uploadImage(savedImage);

      // Delete the image file from the folder after upload
      await savedImage.delete();
      print("Image successfully uploaded and deleted from local storage.");

    } catch (e) {
      print("Error saving or uploading image: $e");
    }
  }

  Future<void> uploadImage(File imageFile) async {
    try {
      var request = http.MultipartRequest('POST',  Uri.parse('${dotenv.env['BACKEND_URL'] ?? ''}/login/run'));
      request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));
      var response = await request.send();

      if (response.statusCode == 200) {
        print("Image uploaded successfully");
      } else {
        print("Image upload failed: ${response.statusCode}");
      }
    } catch (e) {
      print("Error uploading image: $e");
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),

      body: Center(
        child: isCameraInitialized
            ? AspectRatio(
          aspectRatio: controller!.value.aspectRatio,
          child: CameraPreview(controller!),
        )
            : const Text("Click the camera or gallery  below to choose an image",
        style:TextStyle(fontSize:30)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () async {
              if (!isCameraInitialized) {
                initializeCamera();
              } else {
                await captureImage(); // Capture image from camera
              }
            },
            child: const Icon(Icons.camera_alt, size: 30),
            tooltip: 'Capture Image',
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            onPressed: pickImageFromGallery,
            child: const Icon(Icons.photo, size: 30),
            tooltip: 'Pick Image from Gallery',
          ),
        ],
      ),
    );
  }
}