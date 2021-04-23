import '../recognizer.dart';
import '../types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blink_card_recognizer.g.dart';

/// Result object for BlinkCardRecognizer.
class BlinkCardRecognizerResult extends RecognizerResult {
    
    ///The payment card number. 
    String cardNumber;
    
    ///The payment card number prefix. 
    String cardNumberPrefix;
    
    ///Flag which indicatew whether the payment card number is valid or not. 
    bool cardNumberValid;
    
    ///Payment card's security code/value. 
    String cvv;
    
    ///Defines digital signature of recognition results. 
    String digitalSignature;
    
    ///Defines digital signature version. 
    int digitalSignatureVersion;
    
    ///The payment card's expiry date. 
    Date expiryDate;
    
    ///Whether the first scanned side is blurred. 
    bool firstSideBlurred;
    
    ///Full image of the payment card from first side recognition. 
    String firstSideFullDocumentImage;
    
    ///Payment card's IBAN. 
    String iban;
    
    ///Payment card's issuing network. 
    Issuer issuer;
    
    ///Information about the payment card owner. 
    String owner;
    
    ///Status of the last recognition process. 
    BlinkCardProcessingStatus processingStatus;
    
    ///{true} if recognizer has finished scanning first side and is now scanning back side, 
    bool scanningFirstSideDone;
    
    ///Whether the second scanned side is blurred. 
    bool secondSideBlurred;
    
    ///Full image of the payment card from second side recognition. 
    String secondSideFullDocumentImage;
    
    BlinkCardRecognizerResult(Map<String, dynamic> nativeResult): super(RecognizerResultState.values[nativeResult['resultState']]) {
        
        this.cardNumber = nativeResult["cardNumber"];
        
        this.cardNumberPrefix = nativeResult["cardNumberPrefix"];
        
        this.cardNumberValid = nativeResult["cardNumberValid"];
        
        this.cvv = nativeResult["cvv"];
        
        this.digitalSignature = nativeResult["digitalSignature"];
        
        this.digitalSignatureVersion = nativeResult["digitalSignatureVersion"];
        
        this.expiryDate = nativeResult["expiryDate"] != null ? Date(Map<String, dynamic>.from(nativeResult["expiryDate"])) : null;
        
        this.firstSideBlurred = nativeResult["firstSideBlurred"];
        
        this.firstSideFullDocumentImage = nativeResult["firstSideFullDocumentImage"];
        
        this.iban = nativeResult["iban"];
        
        this.issuer = Issuer.values[nativeResult["issuer"]];
        
        this.owner = nativeResult["owner"];
        
        this.processingStatus = BlinkCardProcessingStatus.values[nativeResult["processingStatus"]];
        
        this.scanningFirstSideDone = nativeResult["scanningFirstSideDone"];
        
        this.secondSideBlurred = nativeResult["secondSideBlurred"];
        
        this.secondSideFullDocumentImage = nativeResult["secondSideFullDocumentImage"];
        
    }
}


///Recognizer used for scanning both sides of payment cards.
@JsonSerializable()
class BlinkCardRecognizer extends Recognizer {
    
    ///Whether blured frames filtering is allowed.
    bool allowBlurFilter = true;
    
    ///The settings which control the anonymization of returned data.
    BlinkCardAnonymizationSettings anonymizationSettings = new BlinkCardAnonymizationSettings();
    
    ///Should extract the card CVV
    bool extractCvv = true;
    
    ///Should extract the payment card's expiry date.
    bool extractExpiryDate = true;
    
    ///Should extract the card IBAN
    bool extractIban = true;
    
    ///Should extract the card owner information
    bool extractOwner = true;
    
    ///The DPI (Dots Per Inch) for full document image that should be returned.
    int fullDocumentImageDpi = 250;
    
    ///The extension factors for full document image.
    ImageExtensionFactors fullDocumentImageExtensionFactors = ImageExtensionFactors();
    
    ///Padding is a minimum distance from the edge of the frame and it is defined as a percentage
    double paddingEdge = 0.0;
    
    ///Defines whether full document image will be available in
    bool returnFullDocumentImage = false;
    
    ///Defines whether or not recognition result should be signed.
    bool signResult = false;
    
    BlinkCardRecognizer(): super('BlinkCardRecognizer');

    RecognizerResult createResultFromNative(Map<String, dynamic> nativeResult) {
        return BlinkCardRecognizerResult(nativeResult);
    }

    factory BlinkCardRecognizer.fromJson(Map<String, dynamic> json) => _$BlinkCardRecognizerFromJson(json);

    Map<String, dynamic> toJson() => _$BlinkCardRecognizerToJson(this);
}