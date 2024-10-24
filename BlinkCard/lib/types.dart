import 'package:json_annotation/json_annotation.dart';

part 'types.g.dart';
/// Represents a date extracted from image.
class Date {

    /// day in month
    int? day;
    /// month in year
    int? month;
    /// year
    int? year;

    Date(Map<String, dynamic> nativeDate) {
        this.day = nativeDate['day'];
        this.month = nativeDate['month'];
        this.year = nativeDate['year'];
    }
}

/// Represents a point in image
class Point {

    /// x coordinate of the point
    double? x;
    /// y coordinate of the point
    double? y;

    Point(Map<String, dynamic> nativePoint) {

        this.x = nativePoint['x'] != null? nativePoint['x']*1.0 : null;
        this.y = nativePoint['y'] != null? nativePoint['y']*1.0 : null;
    }
}

/// Represents a quadrilateral location in the image
class Quadrilateral {

    /// upper left point of the quadrilateral
    Point? upperLeft;
    /// upper right point of the quadrilateral
    Point? upperRight;
    /// lower left point of the quadrilateral
    Point? lowerLeft;
    /// lower right point of the quadrilateral
    Point? lowerRight;

    Quadrilateral(Map<String, dynamic> nativeQuad) {
        this.upperLeft = Point(Map<String, dynamic>.from(nativeQuad['upperLeft']));
        this.upperRight = Point(Map<String, dynamic>.from(nativeQuad['upperRight']));
        this.lowerLeft = Point(Map<String, dynamic>.from(nativeQuad['lowerLeft']));
        this.lowerRight = Point(Map<String, dynamic>.from(nativeQuad['lowerRight']));
    }
}

/// Supported BlinkCard card issuer values.
enum Issuer {
    /// Unidentified Card
    Other,
    /// The American Express Company Card
    AmericanExpress,
    /// China UnionPay Card
    ChinaUnionPay,
    /// Diners Club International Card
    Diners,
    /// Discover Card
    DiscoverCard,
    /// Elo card association
    Elo,
    /// The JCB Company Card
    Jcb,
    /// Maestro Debit Card
    Maestro,
    /// Mastercard Inc. Card
    Mastercard,
    /// RuPay
    RuPay,
    /// Interswitch Verve Card
    Verve,
    /// Visa Inc. Card
    Visa,
    /// VPay
    VPay
}

/// Supported BlinkCard cprocessing status.
enum BlinkCardProcessingStatus {
    /// Recognition was successful.
    Success,
    /// Detection of the document failed.
    DetectionFailed,
    /// Preprocessing of the input image has failed.
    ImagePreprocessingFailed,
    /// Recognizer has inconsistent results.
    StabilityTestFailed,
    /// Wrong side of the document has been scanned.
    ScanningWrongSide,
    /// Identification of the fields present on the document has failed.
    FieldIdentificationFailed,
    /// Failed to return a requested image.
    ImageReturnFailed,
    /// Payment card currently not supported by the recognizer.
    UnsupportedCard
}

/// Determines which data is anonymized in the returned recognizer result.
enum BlinkCardAnonymizationMode {
    /// No anonymization is performed in this mode.
    @JsonValue(0) None,
    /// Sensitive data in the document image is anonymized with black boxes covering selected sensitive data. Data returned in result fields is not changed.
    @JsonValue(1) ImageOnly,
    /// Document image is not changed. Data returned in result fields is redacted.
    @JsonValue(2) FieldsOnly,
    /// Sensitive data in the image is anonymized with black boxes covering selected sensitive data. Data returned in result fields is redacted.
    @JsonValue(3) FullResult
}

///Enumerates the possible match levels indicating the strictness of a check result. Higher is stricter.
enum BlinkCardMatchLevel {
    /// Match level is disabled.
    @JsonValue(0) Disabled,
    /// Match level one.
    @JsonValue(1) Level1,
    /// Match level two
    @JsonValue(2) Level2,
    /// Match level three
    @JsonValue(3) Level3,
    /// Match level four
    @JsonValue(4) Level4,
    /// Match level five
    @JsonValue(5) Level5,
    /// Match level six
    @JsonValue(6) Level6,
    /// Match level seven
    @JsonValue(7) Level7,
    /// Match level eight
    @JsonValue(8) Level8,
    /// Match level nine
    @JsonValue(9) Level9,
    /// Match level ten. Most strict match level
    @JsonValue(10) Level10
}

///Enumerates the possible results of BlinkCard's document liveness checks.
enum BlinkCardCheckResult {
    /// Indicates that the check was not performed.
    NotPerformed,
    /// Indicates that the document passed the check successfully.
    Pass,
    ///Indicates that the document failed the check.
    Fail
}

/// Holds the settings which control card number anonymization.
@JsonSerializable()
class CardNumberAnonymizationSettings {

    /// Defines the mode of card number anonymization.
    BlinkCardAnonymizationMode mode = BlinkCardAnonymizationMode.None;
    /// Defines how many digits at the beginning of the card number remain visible after anonymization.
    int prefixDigitsVisible = 0;
    /// Defines how many digits at the end of the card number remain visible after anonymization.
    int suffixDigitsVisible = 0;

    CardNumberAnonymizationSettings();

    factory CardNumberAnonymizationSettings.fromJson(Map<String, dynamic> json) => _$CardNumberAnonymizationSettingsFromJson(json);
    Map<String, dynamic> toJson() => _$CardNumberAnonymizationSettingsToJson(this);
}

/// Holds the settings which control card anonymization.
@JsonSerializable()
class BlinkCardAnonymizationSettings {

    /// Defines the parameters of card number anonymization.
    CardNumberAnonymizationSettings? cardNumberAnonymizationSettings = new CardNumberAnonymizationSettings();
    /// Defines the mode of card number prefix anonymization.
    BlinkCardAnonymizationMode cardNumberPrefixAnonymizationMode = BlinkCardAnonymizationMode.None;
    /// Defines the mode of CVV anonymization.
    BlinkCardAnonymizationMode cvvAnonymizationMode = BlinkCardAnonymizationMode.None;
    /// Defines the mode of IBAN anonymization.
    BlinkCardAnonymizationMode ibanAnonymizationMode = BlinkCardAnonymizationMode.None;
    /// Defines the mode of owner anonymization.
    BlinkCardAnonymizationMode ownerAnonymizationMode = BlinkCardAnonymizationMode.None;

    BlinkCardAnonymizationSettings();

    factory BlinkCardAnonymizationSettings.fromJson(Map<String, dynamic> json) => _$BlinkCardAnonymizationSettingsFromJson(json);
    Map<String, dynamic> toJson() => _$BlinkCardAnonymizationSettingsToJson(this);
}

///Represents the card side for liveness checks
class BlinkCardSide {
  /// Retrieves the result of the check indicating the presence of a live hand.
  BlinkCardCheckResult? handPresenceCheck;
  /// Retrieves the result of the check performed on the document using photocopy detection.
  BlinkCardCheckResult? photocopyCheck;
  /// Retrieves the result of the check performed on the document using screen detection.
  BlinkCardCheckResult? screenCheck;

  BlinkCardSide(Map<String, dynamic> nativeCardSide) {
    this.handPresenceCheck = BlinkCardCheckResult.values[nativeCardSide['handPresenceCheck']];
    this.photocopyCheck = BlinkCardCheckResult.values[nativeCardSide['photocopyCheck']];
    this.screenCheck = BlinkCardCheckResult.values[nativeCardSide['screenCheck']];
  }
}

/// Represents the result of liveness checks on both sides (front and back) of a card.
class DocumentLivenessCheckResult {
  ///  Returns the document liveness result of the first side.
  BlinkCardSide? front;
  /// Return the document liveness result of the back side.
  BlinkCardSide? back;

  DocumentLivenessCheckResult(Map<String, dynamic> nativeDocumentLivenessCheckResult) {
    this.front = nativeDocumentLivenessCheckResult['front'] != null? BlinkCardSide(Map<String, dynamic>.from(nativeDocumentLivenessCheckResult['front'])) : null;
    this.back = nativeDocumentLivenessCheckResult['back'] != null? BlinkCardSide(Map<String, dynamic>.from(nativeDocumentLivenessCheckResult['back'])) : null;
  }
}

/// Extension factors relative to corresponding dimension of the full image. For example,
/// upFactor and downFactor define extensions relative to image height, e.g.
/// when upFactor is 0.5, upper image boundary will be extended for half of image's full
/// height.
@JsonSerializable()
class ImageExtensionFactors {

    /// image extension factor relative to full image height in UP direction.
    double? upFactor = 0.0;
    /// image extension factor relative to full image height in RIGHT direction.
    double? rightFactor = 0.0;
    /// image extension factor relative to full image height in DOWN direction.
    double? downFactor = 0.0;
    /// image extension factor relative to full image height in LEFT direction.
    double? leftFactor = 0.0;

    ImageExtensionFactors();

    factory ImageExtensionFactors.fromJson(Map<String, dynamic> json) => _$ImageExtensionFactorsFromJson(json);
    Map<String, dynamic> toJson() => _$ImageExtensionFactorsToJson(this);
}

/// Result of the data matching algorithm for scanned parts/sides of the document.
enum DataMatchState {
    /// Data matching has not been performed.
    NotPerformed,
    /// Data does not match.
    Failed,
    /// Data match.
    Success
}

/// Defines possible Android device camera video resolution preset 
enum AndroidCameraResolutionPreset {
    /// Will choose camera video resolution which is best for current device.
    @JsonValue(0) PresetDefault,
    /// Attempts to choose camera video resolution as closely as 480p.
    @JsonValue(1) Preset480p,
    /// Attempts to choose camera video resolution as closely as 720p.
    @JsonValue(2) Preset720p,
    /// Attempts to choose camera video resolution as closely as 1080p.
    @JsonValue(3) Preset1080p,
    /// Attempts to choose camera video resolution as closely as 2160p.
    @JsonValue(4) Preset2160p,
    /// Will choose max available camera video resolution.
    @JsonValue(5) PresetMaxAvailable
}

/// Define possible iOS device camera video resolution preset 
enum iOSCameraResolutionPreset {
    /// 480p video will always be used.
    @JsonValue(0) Preset480p,
    /// 720p video will always be used.
    @JsonValue(1) Preset720p,
    /// 1080p video will always be used.
    @JsonValue(2) Preset1080p,
    /// 4K video will always be used.
    @JsonValue(3) Preset4K,
    /// The library will calculate optimal resolution based on the use case and device used.
    @JsonValue(4) PresetOptimal,
    /// Device's maximal video resolution will be used.
    @JsonValue(5) PresetMax,
    /// Device's photo preview resolution will be used.
    @JsonValue(6) PresetPhoto
}