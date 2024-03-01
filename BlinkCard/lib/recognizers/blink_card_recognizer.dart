import '../recognizer.dart';
import '../types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blink_card_recognizer.g.dart';

/// Result object for BlinkCardRecognizer.
class BlinkCardRecognizerResult extends RecognizerResult {
    
    ///The payment card number.
    String? cardNumber;
    
    ///The payment card number prefix.
    String? cardNumberPrefix;
    
    ///The payment card number is valid
    bool? cardNumberValid;
    
    /// Payment card's security code/value.
    String? cvv;
    
    ///Document liveness check (screen, photocopy, hand presence) which can pass or fail.
    DocumentLivenessCheckResult? documentLivenessCheck;
    
    ///The payment card's expiry date.
    Date? expiryDate;
    
    ///Whether the first scanned side is anonymized.
    bool? firstSideAnonymized;
    
    ///Whether the first scanned side is blurred.
    bool? firstSideBlurred;
    
    ///Full image of the payment card from first side recognition.
    String? firstSideFullDocumentImage;
    
    ///Payment card's IBAN.
    String? iban;
    
    ///Payment card's issuing network.
    Issuer? issuer;
    
    ///Information about the payment card owner (name, company, etc.).
    String? owner;
    
    ///Status of the last recognition process.
    BlinkCardProcessingStatus? processingStatus;
    
    ///Returns true if recognizer has finished scanning first side and is now scanning back side,
    /// false if it's still scanning first side.
    bool? scanningFirstSideDone;
    
    ///Whether the second scanned side is anonymized.
    bool? secondSideAnonymized;
    
    ///Whether the second scanned side is blurred.
    bool? secondSideBlurred;
    
    ///Full image of the payment card from second side recognition.
    String? secondSideFullDocumentImage;
    
    BlinkCardRecognizerResult(Map<String, dynamic> nativeResult): super(RecognizerResultState.values[nativeResult['resultState']]) {
        
        this.cardNumber = nativeResult["cardNumber"];
        
        this.cardNumberPrefix = nativeResult["cardNumberPrefix"];
        
        this.cardNumberValid = nativeResult["cardNumberValid"];
        
        this.cvv = nativeResult["cvv"];
        
        this.documentLivenessCheck = nativeResult["documentLivenessCheck"] != null ? DocumentLivenessCheckResult(Map<String, dynamic>.from(nativeResult["documentLivenessCheck"])) : null;
        
        this.expiryDate = nativeResult["expiryDate"] != null ? Date(Map<String, dynamic>.from(nativeResult["expiryDate"])) : null;
        
        this.firstSideAnonymized = nativeResult["firstSideAnonymized"];
        
        this.firstSideBlurred = nativeResult["firstSideBlurred"];
        
        this.firstSideFullDocumentImage = nativeResult["firstSideFullDocumentImage"];
        
        this.iban = nativeResult["iban"];
        
        this.issuer = Issuer.values[nativeResult["issuer"]];
        
        this.owner = nativeResult["owner"];
        
        this.processingStatus = BlinkCardProcessingStatus.values[nativeResult["processingStatus"]];
        
        this.scanningFirstSideDone = nativeResult["scanningFirstSideDone"];
        
        this.secondSideAnonymized = nativeResult["secondSideAnonymized"];
        
        this.secondSideBlurred = nativeResult["secondSideBlurred"];
        
        this.secondSideFullDocumentImage = nativeResult["secondSideFullDocumentImage"];
        
    }
}


///Recognizer used for scanning credit/debit cards.
@JsonSerializable()
class BlinkCardRecognizer extends Recognizer {
    
    ///Defines whether blured frames filtering is allowed
    /// 
    /// 

    bool allowBlurFilter = true;
    
    ///Whether invalid card number is accepted.
    /// 
    /// 

    bool allowInvalidCardNumber = false;
    
    ///Defines whether sensitive data should be redacted from the result.
    /// 
    /// 

    BlinkCardAnonymizationSettings anonymizationSettings = BlinkCardAnonymizationSettings();
    
    ///Should extract CVV
    /// 
    /// 

    bool extractCvv = true;
    
    ///Should extract the payment card's month of expiry
    /// 
    /// 

    bool extractExpiryDate = true;
    
    ///Should extract the payment card's IBAN
    /// 
    /// 

    bool extractIban = true;
    
    ///Should extract the card owner information
    /// 
    /// 

    bool extractOwner = true;
    
    ///Property for setting DPI for full document images
    /// Valid ranges are [100,400]. Setting DPI out of valid ranges throws an exception
    /// 
    /// 

    int fullDocumentImageDpi = 250;
    
    ///Image extension factors for full document image.
    /// 
    /// @see CImageExtensionFactors
    /// 

    ImageExtensionFactors fullDocumentImageExtensionFactors = ImageExtensionFactors();
    
    ///This parameter is used to adjust heuristics that eliminate cases when the hand is present.
    /// 
    /// 

    double handDocumentOverlapThreshold = 0.05;
    
    ///Hand scale is calculated as a ratio between area of hand mask and document mask.
    /// 
    /// 

    double handScaleThreshold = 0.15;
    
    ///Pading is a minimum distance from the edge of the frame and is defined as a percentage of the frame width. Default value is 0.0f and in that case
    /// padding edge and image edge are the same.
    /// Recommended value is 0.02f.
    /// 
    /// 

    double paddingEdge = 0.0;
    
    ///Photocopy analysis match level - higher if stricter.
    /// 
    /// 

    BlinkCardMatchLevel photocopyAnalysisMatchLevel = BlinkCardMatchLevel.Level5;
    
    ///Sets whether full document image of ID card should be extracted.
    /// 
    /// 

    bool returnFullDocumentImage = false;
    
    ///Screen analysis match level - higher if stricter.
    /// 
    /// 

    BlinkCardMatchLevel screenAnalysisMatchLevel = BlinkCardMatchLevel.Level5;
    
    BlinkCardRecognizer(): super('BlinkCardRecognizer');

    RecognizerResult createResultFromNative(Map<String, dynamic> nativeResult) {
        return BlinkCardRecognizerResult(nativeResult);
    }

    factory BlinkCardRecognizer.fromJson(Map<String, dynamic> json) => _$BlinkCardRecognizerFromJson(json);
    Map<String, dynamic> toJson() => _$BlinkCardRecognizerToJson(this);
}