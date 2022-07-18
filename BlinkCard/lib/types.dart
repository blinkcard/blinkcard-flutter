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

/// Supported Legacy BlinkCard card issuer values.
enum LegacyCardIssuer {
    /// Unidentified Card
    Other,
    /// The American Express Company Card
    AmericanExpress,
    /// The Bank of Montreal ABM Card
    BmoAbm,
    /// China T-Union Transportation Card
    ChinaTUnion,
    /// China UnionPay Card
    ChinaUnionPay,
    /// Canadian Imperial Bank of Commerce Advantage Debit Card
    CibcAdvantageDebit,
    /// CISS Card
    Ciss,
    /// Diners Club International Card
    DinersClubInternational,
    /// Diners Club United States & Canada Card
    DinersClubUsCanada,
    /// Discover Card
    DiscoverCard,
    /// HSBC Bank Canada Card
    Hsbc,
    /// RuPay Card
    RuPay,
    /// InterPayment Card
    InterPayment,
    /// InstaPayment Card
    InstaPayment,
    /// The JCB Company Card
    Jcb,
    /// Laser Debit Card (deprecated)
    Laser,
    /// Maestro Debit Card
    Maestro,
    /// Dankort Card
    Dankort,
    /// MIR Card
    Mir,
    /// MasterCard Inc. Card
    MasterCard,
    /// The Royal Bank of Canada Client Card
    RbcClient,
    /// ScotiaBank Scotia Card
    ScotiaBank,
    /// TD Canada Trust Access Card
    TdCtAccess,
    /// Troy Card
    Troy,
    /// Visa Inc. Card
    Visa,
    /// Universal Air Travel Plan Inc. Card
    Uatp,
    /// Interswitch Verve Card
    Verve
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
    @JsonValue(1) None,
    /// Sensitive data in the document image is anonymized with black boxes covering selected sensitive data. Data returned in result fields is not changed.
    @JsonValue(2) ImageOnly,
    /// Document image is not changed. Data returned in result fields is redacted.
    @JsonValue(3) FieldsOnly,
    /// Sensitive data in the image is anonymized with black boxes covering selected sensitive data. Data returned in result fields is redacted.
    @JsonValue(4) FullResult
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
enum DataMatchResult {
    /// Data matching has not been performed.
    NotPerformed,
    /// Data does not match.
    Failed,
    /// Data match.
    Success
}