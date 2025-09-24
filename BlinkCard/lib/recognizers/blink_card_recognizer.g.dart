// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blink_card_recognizer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlinkCardRecognizer _$BlinkCardRecognizerFromJson(Map<String, dynamic> json) =>
    BlinkCardRecognizer()
      ..recognizerType = json['recognizerType'] as String
      ..allowBlurFilter = json['allowBlurFilter'] as bool
      ..allowInvalidCardNumber = json['allowInvalidCardNumber'] as bool
      ..anonymizationSettings = BlinkCardAnonymizationSettings.fromJson(
        json['anonymizationSettings'] as Map<String, dynamic>,
      )
      ..extractCvv = json['extractCvv'] as bool
      ..extractExpiryDate = json['extractExpiryDate'] as bool
      ..extractIban = json['extractIban'] as bool
      ..extractOwner = json['extractOwner'] as bool
      ..fullDocumentImageDpi = (json['fullDocumentImageDpi'] as num).toInt()
      ..fullDocumentImageExtensionFactors = ImageExtensionFactors.fromJson(
        json['fullDocumentImageExtensionFactors'] as Map<String, dynamic>,
      )
      ..handDocumentOverlapThreshold =
          (json['handDocumentOverlapThreshold'] as num).toDouble()
      ..handScaleThreshold = (json['handScaleThreshold'] as num).toDouble()
      ..paddingEdge = (json['paddingEdge'] as num).toDouble()
      ..photocopyAnalysisMatchLevel = $enumDecode(
        _$BlinkCardMatchLevelEnumMap,
        json['photocopyAnalysisMatchLevel'],
      )
      ..returnFullDocumentImage = json['returnFullDocumentImage'] as bool
      ..screenAnalysisMatchLevel = $enumDecode(
        _$BlinkCardMatchLevelEnumMap,
        json['screenAnalysisMatchLevel'],
      )
      ..tiltDetectionLevel = $enumDecode(
        _$BlinkCardDetectionLevelEnumMap,
        json['tiltDetectionLevel'],
      );

Map<String, dynamic> _$BlinkCardRecognizerToJson(
  BlinkCardRecognizer instance,
) => <String, dynamic>{
  'recognizerType': instance.recognizerType,
  'allowBlurFilter': instance.allowBlurFilter,
  'allowInvalidCardNumber': instance.allowInvalidCardNumber,
  'anonymizationSettings': instance.anonymizationSettings,
  'extractCvv': instance.extractCvv,
  'extractExpiryDate': instance.extractExpiryDate,
  'extractIban': instance.extractIban,
  'extractOwner': instance.extractOwner,
  'fullDocumentImageDpi': instance.fullDocumentImageDpi,
  'fullDocumentImageExtensionFactors':
      instance.fullDocumentImageExtensionFactors,
  'handDocumentOverlapThreshold': instance.handDocumentOverlapThreshold,
  'handScaleThreshold': instance.handScaleThreshold,
  'paddingEdge': instance.paddingEdge,
  'photocopyAnalysisMatchLevel':
      _$BlinkCardMatchLevelEnumMap[instance.photocopyAnalysisMatchLevel]!,
  'returnFullDocumentImage': instance.returnFullDocumentImage,
  'screenAnalysisMatchLevel':
      _$BlinkCardMatchLevelEnumMap[instance.screenAnalysisMatchLevel]!,
  'tiltDetectionLevel':
      _$BlinkCardDetectionLevelEnumMap[instance.tiltDetectionLevel]!,
};

const _$BlinkCardMatchLevelEnumMap = {
  BlinkCardMatchLevel.Disabled: 0,
  BlinkCardMatchLevel.Level1: 1,
  BlinkCardMatchLevel.Level2: 2,
  BlinkCardMatchLevel.Level3: 3,
  BlinkCardMatchLevel.Level4: 4,
  BlinkCardMatchLevel.Level5: 5,
  BlinkCardMatchLevel.Level6: 6,
  BlinkCardMatchLevel.Level7: 7,
  BlinkCardMatchLevel.Level8: 8,
  BlinkCardMatchLevel.Level9: 9,
  BlinkCardMatchLevel.Level10: 10,
};

const _$BlinkCardDetectionLevelEnumMap = {
  BlinkCardDetectionLevel.Off: 0,
  BlinkCardDetectionLevel.Low: 1,
  BlinkCardDetectionLevel.Mid: 2,
  BlinkCardDetectionLevel.High: 3,
};
