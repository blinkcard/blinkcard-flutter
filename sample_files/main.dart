import 'package:blinkcard_flutter/microblink_scanner.dart';
import 'package:flutter/material.dart';
import "dart:convert";
import "dart:async";
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _resultString = "";
  String _fullDocumentFirstImageBase64 = "";
  String _fullDocumentSecondImageBase64 = "";

  /// BlinkCard scanning with camera
  Future<void> scan() async {
    String license;
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      license = "sRwCABVjb20ubWljcm9ibGluay5zYW1wbGUBbGV5SkRjbVZoZEdWa1QyNGlPakUzTVRJMU5qTTFNamMyT1RJc0lrTnlaV0YwWldSR2IzSWlPaUprWkdRd05qWmxaaTAxT0RJekxUUXdNRGd0T1RRNE1DMDFORFU0WWpBeFlUVTJZamdpZlE9PT1biknodonmIfXGRoRgDcJJ6XiWcxCFSE8flLOXwEKYwSUjWVAHSwI7GtA+oqJke90M+2giHY4Qqpeh67vsyoYHEyqCI8E6G47yBZxcIN/A7CFQq4IvMF4U7xaE1S4=";
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      license = "sRwCABVjb20ubWljcm9ibGluay5zYW1wbGUAbGV5SkRjbVZoZEdWa1QyNGlPakUzTVRJMU5qTTFOVEEzTlRJc0lrTnlaV0YwWldSR2IzSWlPaUprWkdRd05qWmxaaTAxT0RJekxUUXdNRGd0T1RRNE1DMDFORFU0WWpBeFlUVTJZamdpZlE9Pd63oOMBm0mx/s+0dSOmd4EjsCAoD20P5kOz3xHBmd7BA5bmfN0Ij+Z2ou413GAVLEXtho9QFh9a6VmW32NKZRv+lMG5XGSnij6oVB5I1x3IWED8kluJsVZxFnm9I1U=";
    } else {
      license = "";
    }

    var cardRecognizer = BlinkCardRecognizer();
    cardRecognizer.returnFullDocumentImage = true;

    BlinkCardOverlaySettings settings = BlinkCardOverlaySettings();

    var results = await MicroblinkScanner.scanWithCamera(
        RecognizerCollection([cardRecognizer]), settings, license);

    if (!mounted) return;

    if (results.length == 0) return;
    for (var result in results) {
      if (result is BlinkCardRecognizerResult) {
        _resultString = getCardResultString(result);
        
        setState(() {
          _resultString = _resultString;
          _fullDocumentFirstImageBase64 = result.firstSideFullDocumentImage ?? "";
          _fullDocumentSecondImageBase64 = result.secondSideFullDocumentImage ?? "";
        });

        return;
      }
    }
  }
  
  /// BlinkCard scanning with DirectAPI that requires both card images.
  /// Best used for getting the information from both front and backside information from various cards
  Future<void> directApiTwoSidesScan() async {
    String license;
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      license = "sRwCABVjb20ubWljcm9ibGluay5zYW1wbGUBbGV5SkRjbVZoZEdWa1QyNGlPakUzTVRJMU5qTTFNamMyT1RJc0lrTnlaV0YwWldSR2IzSWlPaUprWkdRd05qWmxaaTAxT0RJekxUUXdNRGd0T1RRNE1DMDFORFU0WWpBeFlUVTJZamdpZlE9PT1biknodonmIfXGRoRgDcJJ6XiWcxCFSE8flLOXwEKYwSUjWVAHSwI7GtA+oqJke90M+2giHY4Qqpeh67vsyoYHEyqCI8E6G47yBZxcIN/A7CFQq4IvMF4U7xaE1S4=";
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      license = "sRwCABVjb20ubWljcm9ibGluay5zYW1wbGUAbGV5SkRjbVZoZEdWa1QyNGlPakUzTVRJMU5qTTFOVEEzTlRJc0lrTnlaV0YwWldSR2IzSWlPaUprWkdRd05qWmxaaTAxT0RJekxUUXdNRGd0T1RRNE1DMDFORFU0WWpBeFlUVTJZamdpZlE9Pd63oOMBm0mx/s+0dSOmd4EjsCAoD20P5kOz3xHBmd7BA5bmfN0Ij+Z2ou413GAVLEXtho9QFh9a6VmW32NKZRv+lMG5XGSnij6oVB5I1x3IWED8kluJsVZxFnm9I1U=";
    } else {
      license = "";
    }

    try {
      // Get images of both sides of the card with the pickMultiImage method
      // First select the side where the card number is located and the other back side of the card
      final images = await ImagePicker().pickMultiImage();

      // Get the first image where the card number is located
      final firstImage = images[0];
      if (firstImage == null) return;

      // Convert the first image to base64
      List<int> firstImageBytes = await firstImage.readAsBytes();
      String firstImageBase64 = base64Encode(firstImageBytes);

      // Get the image of the second side of the card
      final secondImage = images[1];
      if (secondImage == null) return;

      // Convert picked image to base64
      List<int> secondImageBytes = await secondImage.readAsBytes();
      String secondImageBase64 = base64Encode(secondImageBytes);

      var cardRecognizer = BlinkCardRecognizer();
      cardRecognizer.returnFullDocumentImage = true;

      // Pass the images to the scanWithDirectApi method
      var results = await MicroblinkScanner.scanWithDirectApi(
          RecognizerCollection([cardRecognizer]), firstImageBase64, secondImageBase64, license);

      if (!mounted) return;

      if (results.length == 0) return;
      for (var result in results) {
        if (result is BlinkCardRecognizerResult) {
          _resultString = getCardResultString(result);
          setState(() {
            _resultString = _resultString;
            _fullDocumentFirstImageBase64 = result.firstSideFullDocumentImage ?? "";
            _fullDocumentSecondImageBase64 = result.secondSideFullDocumentImage ?? "";
          });
          return;
        }
      }
    } catch (directApiError) {
        if (directApiError is PlatformException) {
          setState(() {
            _resultString = directApiError.message ?? "Unknown error occurred";
            _fullDocumentFirstImageBase64 = "";
            _fullDocumentSecondImageBase64 = "";
        });
        } 
    }
  }

  /// BlinkCard scanning with DirectAPI that requires one card image.
  /// Best used for cards that have all of the information on one side, or if the needed information is on one side
  Future<void> directApiOneSideScan() async {
    String license;
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      license = "sRwCABVjb20ubWljcm9ibGluay5zYW1wbGUBbGV5SkRjbVZoZEdWa1QyNGlPakUzTVRJMU5qTTFNamMyT1RJc0lrTnlaV0YwWldSR2IzSWlPaUprWkdRd05qWmxaaTAxT0RJekxUUXdNRGd0T1RRNE1DMDFORFU0WWpBeFlUVTJZamdpZlE9PT1biknodonmIfXGRoRgDcJJ6XiWcxCFSE8flLOXwEKYwSUjWVAHSwI7GtA+oqJke90M+2giHY4Qqpeh67vsyoYHEyqCI8E6G47yBZxcIN/A7CFQq4IvMF4U7xaE1S4=";
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      license = "sRwCABVjb20ubWljcm9ibGluay5zYW1wbGUAbGV5SkRjbVZoZEdWa1QyNGlPakUzTVRJMU5qTTFOVEEzTlRJc0lrTnlaV0YwWldSR2IzSWlPaUprWkdRd05qWmxaaTAxT0RJekxUUXdNRGd0T1RRNE1DMDFORFU0WWpBeFlUVTJZamdpZlE9Pd63oOMBm0mx/s+0dSOmd4EjsCAoD20P5kOz3xHBmd7BA5bmfN0Ij+Z2ou413GAVLEXtho9QFh9a6VmW32NKZRv+lMG5XGSnij6oVB5I1x3IWED8kluJsVZxFnm9I1U=";
    } else {
      license = "";
    }
    try {
      // Pick the image where the card number is located
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      // Convert the picked image to base64
      List<int> imageBytes = await image.readAsBytes();
      String imageBase64 = base64Encode(imageBytes);

      var cardRecognizer = BlinkCardRecognizer();
      cardRecognizer.returnFullDocumentImage = true;
      cardRecognizer.extractCvv = false;
      cardRecognizer.extractIban = false;
      cardRecognizer.extractExpiryDate = false;
    
      // Pass the image to the scanWithDirectApi method
      var results = await MicroblinkScanner.scanWithDirectApi(
          RecognizerCollection([cardRecognizer]), imageBase64, null, license);

      if (!mounted) return;

      if (results.length == 0) return;
      for (var result in results) {
        if (result is BlinkCardRecognizerResult) {
          _resultString = getCardResultString(result);
          setState(() {
            _resultString = _resultString;
            _fullDocumentFirstImageBase64 = result.firstSideFullDocumentImage ?? "";
            _fullDocumentSecondImageBase64 = "";
          });
          return;
        }
      }
    } catch (directApiError) {
        if (directApiError is PlatformException) {
          setState(() {
            _resultString = directApiError.message ?? "Unknown error occurred";
            _fullDocumentFirstImageBase64 = "";
            _fullDocumentSecondImageBase64 = "";
        });
        } 
    }
  }

  String getCardResultString(BlinkCardRecognizerResult result) {
    return buildResult(result.cardNumber, 'Card Number') +
      buildResult(result.cardNumberPrefix, 'Card Number Prefix') +
      buildResult(result.iban, 'IBAN') +
      buildResult(result.cvv, 'CVV') +
      buildResult(result.owner, 'Owner') +
      buildResult(result.cardNumberValid.toString(), 'Card Number Valid') +
      buildDateResult(result.expiryDate, 'Expiry date') + 
      buildLivenessResult(result.documentLivenessCheck?.front, 'Front side liveness checks') +
      buildLivenessResult(result.documentLivenessCheck?.back, 'Back side liveness checks');
  }

  String buildResult(String? result, String propertyName) {
    if (result == null || result.isEmpty) {
      return "";
    }

    return propertyName + ": " + result + "\n";
  }

  String buildLivenessResult(BlinkCardSide? result, String propertyName) {
    if (result == null) {
      return "";
    }

    return "\n" + propertyName + ": " + "\n" +
      buildResult(result.handPresenceCheck.toString(), 'Hand presence check') +
      buildResult(result.photocopyCheck.toString(), 'Photocopy check') +
      buildResult(result.screenCheck.toString(), 'Screen check');
  }

  String buildDateResult(Date? result, String propertyName) {
    if (result == null || result.year == 0) {
      return "";
    }

    return buildResult(
        "${result.day}.${result.month}.${result.year}", propertyName);
  }

  String buildIntResult(int? result, String propertyName) {
    if (result == null || result < 0) {
      return "";
    }

    return buildResult(result.toString(), propertyName);
  }

  Future<void> showAlertDialog(BuildContext context,String title, String message) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    Widget fullDocumentFirstImage = Container();
    if (_fullDocumentFirstImageBase64 != null &&
        _fullDocumentFirstImageBase64 != "") {
      fullDocumentFirstImage = Column(
        children: <Widget>[
          Text("Document First Image:"),
          Image.memory(
            Base64Decoder().convert(_fullDocumentFirstImageBase64),
            height: 180,
            width: 350,
          )
        ],
      );
    }

    Widget fullDocumentSecondImage = Container();
    if (_fullDocumentSecondImageBase64 != null &&
        _fullDocumentSecondImageBase64 != "") {
      fullDocumentSecondImage = Column(
        children: <Widget>[
          Text("Document Second Image:"),
          Image.memory(
            Base64Decoder().convert(_fullDocumentSecondImageBase64),
            height: 180,
            width: 350,
          )
        ],
      );
    }

return MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: const Text("BlinkCard Sample"),
    ),
    body: SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Builder(
        builder: (BuildContext context) {
          return Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: ElevatedButton(
                  onPressed: () => scan(),
                  child: Text("Scan with camera"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    showAlertDialog(context, 
                    'DirectAPI TwoSides instructions',
                    'Select two images for processing.\nThe first selected image needs to be side where the card number is located.\nThe second image needs to be the other side of the card.')
                    .then((_) {
                      directApiTwoSidesScan();
                    });
                  },
                  child: Text("DirectAPI two side scan"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: ElevatedButton(
                    onPressed: () {
                      showAlertDialog(context, 
                      'DirectAPI OneSide instructions',
                      'Select one image for processing.\nThe image needs to be side of the card where the card number is located.')
                      .then((_) {
                        directApiOneSideScan();
                      });
                    },
                  child: Text("DirectAPI one side scan"),
                ),
              ),
              Text(_resultString),
              fullDocumentFirstImage,
              fullDocumentSecondImage,
            ],
          );
        },
      ),
    ),
  ),
);
  }
}