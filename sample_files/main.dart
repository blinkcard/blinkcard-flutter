import 'package:blinkid_flutter/microblink_scanner.dart' as BlinkIDScanner;
import 'package:blinkcard_flutter/blinkcard_scanner.dart' as BlinkCardScanner;
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
  String _fullDocumentFrontImageBase64 = "";
  String _fullDocumentBackImageBase64 = "";
  String _faceImageBase64 = "";

  Future<void> scanBlinkCard() async {
    String license;
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      license = "sRwAAAEVY29tLm1pY3JvYmxpbmsuc2FtcGxl1BIcP6dpSuS/37rVPvGgnEXtW6n0WYNXlN/0i1f88yoVpcC6wVI7C9/PwW96iHudfFxZtXdYuU3G3FGWKgCcqkSdZwRtiHrFeYz8beVEwPAGbLMPGidJ8qm5ZtgfLYHJ5NqR0qfIfqKTIDlsGzUY2D2qp3KUfYcscbf9JftuQdMpQ8VfQ8eu0+x1aUckcowsgAfq8/CTF3cpaSF1mBKMCO+idtTRWI8B52aZZDeybQ==";
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      license = "sRwAAAAVY29tLm1pY3JvYmxpbmsuc2FtcGxlU9kJdb5ZkGlTu623Pixsw037mGhBUOlKf9FyC46r0aJfr+2FJclONWXQv/Xlj27pDDhp07b66EWvmCZeP9oUM7zUHo17x8A4DC8nIZhxCsRgz5FLeMD7opEa+XVTb3/kxNOc8zNZ2XSG0Pw9VTxYf/74hEC7mVhYMIK+4Nf94HM5hujNJInjb5BRLBqrje6tcOlqgSDdQGBkCIre9FOLJDgVtyq41HIwC4cxSS/ryg==";
    } else {
      license = "";
    }

    var cardRecognizer = BlinkCardScanner.BlinkCardRecognizer();
    cardRecognizer.returnFullDocumentImage = true;

    BlinkCardScanner.BlinkCardOverlaySettings settings = BlinkCardScanner.BlinkCardOverlaySettings();

    var results = await BlinkCardScanner.MicroblinkScanner.scanWithCamera(
        BlinkCardScanner.RecognizerCollection([cardRecognizer]), settings, license);

    if (!mounted) return;

    if (results.length == 0) return;
    for (var result in results) {
      if (result is BlinkCardScanner.BlinkCardRecognizerResult) {
        _resultString = getCardResultString(result);

        setState(() {
          _resultString = _resultString;
          _fullDocumentFrontImageBase64 = result.firstSideFullDocumentImage ?? "";
          _fullDocumentBackImageBase64 = result.secondSideFullDocumentImage ?? "";
        });

        return;
      }
    }
  }

  String getCardResultString(BlinkCardScanner.BlinkCardRecognizerResult result) {
    return buildResult(result.cardNumber, 'Card Number') +
        buildResult(result.cardNumberPrefix, 'Card Number Prefix') +
        buildResult(result.iban, 'IBAN') +
        buildResult(result.cvv, 'CVV') +
        buildResult(result.owner, 'Owner') +
        buildResult(result.cardNumberValid.toString(), 'Card Number Valid') +
        buildDateResult(result.expiryDate, 'Expiry date');
  }

  String buildDateResult(BlinkCardScanner.Date? result, String propertyName) {
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


  Future<void> scan() async {
    String license;
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      license = "sRwAAAEVY29tLm1pY3JvYmxpbmsuc2FtcGxl1BIcP4FpSuS/38JVOjaokGTnHzh0+jPiIF6FmxB6HbydyJKQLtbxqEvE9p31fa1hJ86+UO6QExw84dLWRh8VzN06qa5DEymbZROqdYfnenaDfKi9+t9fqFOKuiurMo6HRoUV/CN0ZhVTZAgUExnslLULEfxd+OVy7l7jTJIgNbP8BQbrlaFtwSti2Ree1z6Kk1muQd8Hj4X301oXfQnIWcMTshJqAk7SOJeE8oIXyKVmqrerKir+5x1Oz9IbzfRCWkby2GlyjkVoyGgWj2e9WGhqnP8lijgkfpkpZ8YTZosjY1cyCXhH08SNZjOrGAtASKDjkbjb";
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      license = "sRwAAAAVY29tLm1pY3JvYmxpbmsuc2FtcGxlU9kJdZhZkGlTu9U3Oitiw6TT2FGkiyJFlAhM8pExgH/ZF5IuOoC/DbKHoiR382JaMb+r7NDBTzi88CBCEGTbXlCknk+hJObhf+9SOOJyV9scpqUqGgudxZCbR7Ao8QVhwb7XavkyHr+6j1COdVVFlV105JVZF2y7TTB/c6qKl1YLlEPsHcgQJIR15cWeLaSrM9SDq3cW66fdVqjrmXTlZOpo3r6Kzc5LWa+B/kFt7oEJGC3+E8RVD0L/BM6W0vQvCFrgz2XMss7AmHyHugG2t7xId3TBcx9Jct+EcEjICkuJ3KnzdNj8OlVIHcVAlEcLcqx90wxL";
    } else {
      license = "";
    }

    var idRecognizer = BlinkIDScanner.BlinkIdCombinedRecognizer();
    idRecognizer.returnFullDocumentImage = true;
    idRecognizer.returnFaceImage = true;

    BlinkIDScanner.BlinkIdOverlaySettings settings = BlinkIDScanner.BlinkIdOverlaySettings();

    var results = await BlinkIDScanner.BlinkIDScanner.scanWithCamera(
        BlinkIDScanner.RecognizerCollection([idRecognizer]), settings, license);

    if (!mounted) return;

    if (results.length == 0) return;
    for (var result in results) {
      if (result is BlinkIDScanner.BlinkIdCombinedRecognizerResult) {
        if (result.mrzResult?.documentType == BlinkIDScanner.MrtdDocumentType.Passport) {
          _resultString = getPassportResultString(result);
        } else {
          _resultString = getIdResultString(result);
        }

        setState(() {
          _resultString = _resultString;
          _fullDocumentFrontImageBase64 = result.fullDocumentFrontImage ?? "";
          _fullDocumentBackImageBase64 = result.fullDocumentBackImage ?? "";
          _faceImageBase64 = result.faceImage ?? "";
        });

        return;
      }
    }
  }

  String getIdResultString(BlinkIDScanner.BlinkIdCombinedRecognizerResult result) {
    return buildResult(result.firstName, "First name") +
        buildResult(result.lastName, "Last name") +
        buildResult(result.fullName, "Full name") +
        buildResult(result.localizedName, "Localized name") +
        buildResult(result.additionalNameInformation, "Additional name info") +
        buildResult(result.address, "Address") +
        buildResult(
            result.additionalAddressInformation, "Additional address info") +
        buildResult(result.documentNumber, "Document number") +
        buildResult(
            result.documentAdditionalNumber, "Additional document number") +
        buildResult(result.sex, "Sex") +
        buildResult(result.issuingAuthority, "Issuing authority") +
        buildResult(result.nationality, "Nationality") +
        buildIDDateResult(result.dateOfBirth, "Date of birth") +
        buildIntResult(result.age, "Age") +
        buildIDDateResult(result.dateOfIssue, "Date of issue") +
        buildIDDateResult(result.dateOfExpiry, "Date of expiry") +
        buildResult(result.dateOfExpiryPermanent.toString(),
            "Date of expiry permanent") +
        buildResult(result.maritalStatus, "Martial status") +
        buildResult(result.personalIdNumber, "Personal Id Number") +
        buildResult(result.profession, "Profession") +
        buildResult(result.race, "Race") +
        buildResult(result.religion, "Religion") +
        buildResult(result.residentialStatus, "Residential Status") +
        buildDriverLicenceResult(result.driverLicenseDetailedInfo);
  }

  String buildResult(String? result, String propertyName) {
    if (result == null || result.isEmpty) {
      return "";
    }

    return propertyName + ": " + result + "\n";
  }

  String buildIDDateResult(BlinkIDScanner.Date? result, String propertyName) {
    if (result == null || result.year == 0) {
      return "";
    }

    return buildResult(
        "${result.day}.${result.month}.${result.year}", propertyName);
  }

  String buildDriverLicenceResult(BlinkIDScanner.DriverLicenseDetailedInfo? result) {
    if (result == null) {
      return "";
    }

    return buildResult(result.restrictions, "Restrictions") +
        buildResult(result.endorsements, "Endorsements") +
        buildResult(result.vehicleClass, "Vehicle class") +
        buildResult(result.conditions, "Conditions");
  }

  String getPassportResultString(BlinkIDScanner.BlinkIdCombinedRecognizerResult? result) {

    if(result == null){
      return "";
    }

    var dateOfBirth = "";
    if (result.mrzResult?.dateOfBirth != null) {
      dateOfBirth = "Date of birth: ${result.mrzResult!.dateOfBirth?.day}."
          "${result.mrzResult!.dateOfBirth?.month}."
          "${result.mrzResult!.dateOfBirth?.year}\n";
    }

    var dateOfExpiry = "";
    if (result.mrzResult?.dateOfExpiry != null) {
      dateOfExpiry = "Date of expiry: ${result.mrzResult?.dateOfExpiry?.day}."
          "${result.mrzResult?.dateOfExpiry?.month}."
          "${result.mrzResult?.dateOfExpiry?.year}\n";
    }

    return "First name: ${result.mrzResult?.secondaryId}\n"
        "Last name: ${result.mrzResult?.primaryId}\n"
        "Document number: ${result.mrzResult?.documentNumber}\n"
        "Sex: ${result.mrzResult?.gender}\n"
        "$dateOfBirth"
        "$dateOfExpiry";
  }

  @override
  Widget build(BuildContext context) {
    Widget fullDocumentFrontImage = Container();
    if (_fullDocumentFrontImageBase64 != null &&
        _fullDocumentFrontImageBase64 != "") {
      fullDocumentFrontImage = Column(
        children: <Widget>[
          Text("Document Front Image:"),
          Image.memory(
            Base64Decoder().convert(_fullDocumentFrontImageBase64),
            height: 180,
            width: 350,
          )
        ],
      );
    }

    Widget fullDocumentBackImage = Container();
    if (_fullDocumentBackImageBase64 != null &&
        _fullDocumentBackImageBase64 != "") {
      fullDocumentBackImage = Column(
        children: <Widget>[
          Text("Document Back Image:"),
          Image.memory(
            Base64Decoder().convert(_fullDocumentBackImageBase64),
            height: 180,
            width: 350,
          )
        ],
      );
    }

    Widget faceImage = Container();
    if (_faceImageBase64 != null && _faceImageBase64 != "") {
      faceImage = Column(
        children: <Widget>[
          Text("Face Image:"),
          Image.memory(
            Base64Decoder().convert(_faceImageBase64),
            height: 150,
            width: 100,
          )
        ],
      );
    }

    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("BlinkID Sample"),
          ),
          body: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Padding(
                      child: RaisedButton(
                        child: Text("Scan BlinkID"),
                        onPressed: () => scan(),
                      ),
                      padding: EdgeInsets.only(bottom: 16.0)),
                  Padding(
                      child: RaisedButton(
                        child: Text("Scan BlinkCard"),
                        onPressed: () => scanBlinkCard(),
                      ),
                      padding: EdgeInsets.only(bottom: 16.0)),
                  Text(_resultString),
                  fullDocumentFrontImage,
                  fullDocumentBackImage,
                  faceImage,
                ],
              )),
        ));
  }
}
