import 'package:json_annotation/json_annotation.dart';

export 'package:blinkcard_flutter/recognizers/success_frame_grabber_recognizer.dart';
export 'package:blinkcard_flutter/recognizers/blink_card_recognizer.dart';
part 'recognizer.g.dart';

/// Base class for all recognizers.
/// Recognizer is object that performs recognition of image
/// and updates its result with data extracted from the image.
@JsonSerializable()
class Recognizer {

  /// Type of recognizer
  String recognizerType;

  Recognizer(this.recognizerType);

  RecognizerResult createResultFromNative(Map<String, dynamic> nativeResult) {
    return RecognizerResult(nativeResult['resultState']);
  }

  factory Recognizer.fromJson(Map<String, dynamic> json) => _$RecognizerFromJson(json);
  Map<String, dynamic> toJson() => _$RecognizerToJson(this);
}

/// Possible states of the Recognizer's result
enum RecognizerResultState {
  /// Recognizer result is empty
  empty,
  /// Recognizer result contains some values, but is incomplete or it contains all values, but some are uncertain
  uncertain,
  /// Recognizer result contains all required values
  valid,
  stageValid
}

/// Base class for all recognizer's result objects.
/// Recognizer result contains data extracted from the image.
@JsonSerializable()
class RecognizerResult {

  /// State of the result. It is always one of the values represented by RecognizerResultState enum
  RecognizerResultState resultState;

  RecognizerResult(this.resultState);

  factory RecognizerResult.fromJson(Map<String, dynamic> json) => _$RecognizerResultFromJson(json);
  Map<String, dynamic> toJson() => _$RecognizerResultToJson(this);
}

@JsonSerializable()
class RecognizerCollection {

  List<Recognizer> recognizerArray;

  bool allowMultipleResults = false;

  int milisecondsBeforeTimeout = 0;

  RecognizerCollection(this.recognizerArray);

  factory RecognizerCollection.fromJson(Map<String, dynamic> json) => _$RecognizerCollectionFromJson(json);
  Map<String, dynamic> toJson() => _$RecognizerCollectionToJson(this);
}