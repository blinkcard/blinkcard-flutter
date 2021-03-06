import '../recognizer.dart';
import '../types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'legacy_blink_card_recognizer.g.dart';

/// Result object for LegacyBlinkCardRecognizer.
class LegacyBlinkCardRecognizerResult extends RecognizerResult {
    
    ///The payment card number. 
    String? cardNumber;
    
    /// Payment card's security code/value 
    String? cvv;
    
    ///Returns CDataMatchResultSuccess if data from scanned parts/sides of the document match,
    /// CDataMatchResultFailed otherwise. For example if date of expiry is scanned from the front and back side
    /// of the document and values do not match, this method will return CDataMatchResultFailed. Result will
    /// be CDataMatchResultSuccess only if scanned values for all fields that are compared are the same. 
    DataMatchResult? documentDataMatch;
    
    ///back side image of the document if enabled with returnFullDocumentImage property. 
    String? fullDocumentBackImage;
    
    ///front side image of the document if enabled with returnFullDocumentImage property. 
    String? fullDocumentFrontImage;
    
    ///Payment card's IBAN 
    String? iban;
    
    ///Payment card's inventory number. 
    String? inventoryNumber;
    
    ///Payment card's issuing network 
    LegacyCardIssuer? issuer;
    
    ///Information about the payment card owner (name, company, etc.). 
    String? owner;
    
    ///Returns true if recognizer has finished scanning first side and is now scanning back side,
    /// false if it's still scanning first side. 
    bool? scanningFirstSideDone;
    
    ///The payment card's last month of validity. 
    Date? validThru;
    
    LegacyBlinkCardRecognizerResult(Map<String, dynamic> nativeResult): super(RecognizerResultState.values[nativeResult['resultState']]) {
        
        this.cardNumber = nativeResult["cardNumber"];
        
        this.cvv = nativeResult["cvv"];
        
        this.documentDataMatch = DataMatchResult.values[nativeResult["documentDataMatch"]];
        
        this.fullDocumentBackImage = nativeResult["fullDocumentBackImage"];
        
        this.fullDocumentFrontImage = nativeResult["fullDocumentFrontImage"];
        
        this.iban = nativeResult["iban"];
        
        this.inventoryNumber = nativeResult["inventoryNumber"];
        
        this.issuer = LegacyCardIssuer.values[nativeResult["issuer"]];
        
        this.owner = nativeResult["owner"];
        
        this.scanningFirstSideDone = nativeResult["scanningFirstSideDone"];
        
        this.validThru = nativeResult["validThru"] != null ? Date(Map<String, dynamic>.from(nativeResult["validThru"])) : null;
        
    }
}


///Recognizer used for scanning the front side of credit/debit cards.
@JsonSerializable()
class LegacyBlinkCardRecognizer extends Recognizer {
    
    ///Should anonymize the card number area (redact image pixels) on the document image result
    /// 
    /// 
    bool anonymizeCardNumber = false;
    
    ///Should anonymize the CVV on the document image result
    /// 
    /// 
    bool anonymizeCvv = false;
    
    ///Should anonymize the IBAN area (redact image pixels) on the document image result
    /// 
    /// 
    bool anonymizeIban = false;
    
    ///Should anonymize the owner area (redact image pixels) on the document image result
    /// 
    /// 
    bool anonymizeOwner = false;
    
    ///Defines if glare detection should be turned on/off.
    /// 
    /// 
    bool detectGlare = true;
    
    ///Should extract CVV
    /// 
    /// 
    bool extractCvv = true;
    
    ///Should extract the payment card's IBAN
    /// 
    /// 
    bool extractIban = false;
    
    ///Should extract the card's inventory number
    /// 
    /// 
    bool extractInventoryNumber = true;
    
    ///Should extract the card owner information
    /// 
    /// 
    bool extractOwner = false;
    
    ///Should extract the payment card's month of expiry
    /// 
    /// 
    bool extractValidThru = true;
    
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
    
    ///Sets whether full document image of ID card should be extracted.
    /// 
    /// 
    bool returnFullDocumentImage = false;
    
    LegacyBlinkCardRecognizer(): super('LegacyBlinkCardRecognizer');

    RecognizerResult createResultFromNative(Map<String, dynamic> nativeResult) {
        return LegacyBlinkCardRecognizerResult(nativeResult);
    }

    factory LegacyBlinkCardRecognizer.fromJson(Map<String, dynamic> json) => _$LegacyBlinkCardRecognizerFromJson(json);
    Map<String, dynamic> toJson() => _$LegacyBlinkCardRecognizerToJson(this);
}