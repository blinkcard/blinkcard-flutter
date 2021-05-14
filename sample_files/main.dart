import 'package:blinkcard_flutter/microblink_scanner.dart';
import 'package:flutter/material.dart';
import "dart:convert";
import "dart:async";

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

  Future<void> scan() async {
    String license;
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      license = "sRwAAAEVY29tLm1pY3JvYmxpbmsuc2FtcGxl1BIcP6dpSuS/37rVOeGPMWzs39PRBgwM++WWSOa9w92s2Hn7+UdGcj+24Qru7zu1wxKzfLavdwHIzHlNKddkURwZVIvzE9jPilOKiRc26Bmwum9fehPfOzB0MUCUog2U+itV8GM8VHReXZe4A6COTULp5z3GZ0O9dcaPcuHhtzGZkCjDka9KCJxcLQmvIXbz/jTDVW/xhH4JPM4GIMlhRSePMV7gjWx8jwKrD0TKSQ==";
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      license = "sRwAAAAVY29tLm1pY3JvYmxpbmsuc2FtcGxlU9kJdb5ZkGlTu623OTxHZKAmHTzXqVNPuhHHnXm497TWowJa0vswsDtOQZq7Sc8lndoPORaoDMYFMvzd4/aLTADiHm1Tg3+sCO9AS5lKKIrKANkKNEDvlHwYct9+g5e3xyq6fVy+uMzsdkFZqqbpCChDILiBQOJF4NOTufTLEDSeVNNV10nLisEBYEzD4zWZ9vnBZRNvg7WeEHOUoAOkn521e3E/oK9Andekqi0zbg==";
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
          _fullDocumentFirstImageBase64 = result.firstSideFullDocumentImage;
          _fullDocumentSecondImageBase64 = result.secondSideFullDocumentImage;
        });

        return;
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
      buildDateResult(result.expiryDate, 'Expiry date');
  }

  String buildResult(String result, String propertyName) {
    if (result == null || result.isEmpty) {
      return "";
    }

    return propertyName + ": " + result + "\n";
  }

  String buildDateResult(Date result, String propertyName) {
    if (result == null || result.year == 0) {
      return "";
    }

    return buildResult(
        "${result.day}.${result.month}.${result.year}", propertyName);
  }

  String buildIntResult(int result, String propertyName) {
    if (result < 0) {
      return "";
    }

    return buildResult(result.toString(), propertyName);
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
          child: Column(
            children: <Widget>[
              Padding(
                  child: RaisedButton(
                    child: Text("Scan"),
                    onPressed: () => scan(),
                  ),
                  padding: EdgeInsets.only(bottom: 16.0)),
              Text(_resultString),
              fullDocumentFirstImage,
              fullDocumentSecondImage,
            ],
          )),
    ));
  }
}
