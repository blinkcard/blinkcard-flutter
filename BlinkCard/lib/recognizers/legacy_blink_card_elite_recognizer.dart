import '../recognizer.dart';
import '../types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'legacy_blink_card_elite_recognizer.g.dart';

/// Result object for LegacyBlinkCardEliteRecognizer.
class LegacyBlinkCardEliteRecognizerResult extends RecognizerResult {
    
    ///The payment card number. 
    String? cardNumber;
    
    ///Payment card's security code/value. 
    String? cvv;
    
    ///Defines result of the data matching algorithm for scanned parts/sides of the document. 
    DataMatchResult? documentDataMatch;
    
    ///Back side image of the document 
    String? fullDocumentBackImage;
    
    ///Front side image of the document 
    String? fullDocumentFrontImage;
    
    ///Payment card's inventory number. 
    String? inventoryNumber;
    
    ///Information about the payment card owner (name, company, etc.) 
    String? owner;
    
    ///{true} if recognizer has finished scanning first side and is now scanning back side, 
    bool? scanningFirstSideDone;
    
    ///The payment card's last month of validity. 
    Date? validThru;
    
    LegacyBlinkCardEliteRecognizerResult(Map<String, dynamic> nativeResult): super(RecognizerResultState.values[nativeResult['resultState']]) {
        
        this.cardNumber = nativeResult["cardNumber"];
        
        this.cvv = nativeResult["cvv"];
        
        this.documentDataMatch = DataMatchResult.values[nativeResult["documentDataMatch"]];
        
        this.fullDocumentBackImage = nativeResult["fullDocumentBackImage"];
        
        this.fullDocumentFrontImage = nativeResult["fullDocumentFrontImage"];
        
        this.inventoryNumber = nativeResult["inventoryNumber"];
        
        this.owner = nativeResult["owner"];
        
        this.scanningFirstSideDone = nativeResult["scanningFirstSideDone"];
        
        this.validThru = nativeResult["validThru"] != null ? Date(Map<String, dynamic>.from(nativeResult["validThru"])) : null;
        
    }
}


///Recognizer used for scanning both sides of elite payment cards.
@JsonSerializable()
class LegacyBlinkCardEliteRecognizer extends Recognizer {
    
    ///Should anonymize the card number area (redact image pixels) on the document image result
    bool anonymizeCardNumber = false;
    
    ///Should anonymize the CVV area (redact image pixels) on the document image result
    bool anonymizeCvv = false;
    
    ///Should anonymize the owner area (redact image pixels) on the document image result
    bool anonymizeOwner = false;
    
    ///Defines whether glare detector is enabled.
    bool detectGlare = true;
    
    ///Should extract the card's inventory number
    bool extractInventoryNumber = true;
    
    ///Should extract the card owner information
    bool extractOwner = true;
    
    ///Should extract the payment card's month of expiry
    bool extractValidThru = true;
    
    ///The DPI (Dots Per Inch) for full document image that should be returned.
    int fullDocumentImageDpi = 250;
    
    ///The extension factors for full document image.
    ImageExtensionFactors fullDocumentImageExtensionFactors = ImageExtensionFactors();
    
    ///Defines whether full document image will be available in
    bool returnFullDocumentImage = false;
    
    LegacyBlinkCardEliteRecognizer(): super('LegacyBlinkCardEliteRecognizer');

    RecognizerResult createResultFromNative(Map<String, dynamic> nativeResult) {
        return LegacyBlinkCardEliteRecognizerResult(nativeResult);
    }

    factory LegacyBlinkCardEliteRecognizer.fromJson(Map<String, dynamic> json) => _$LegacyBlinkCardEliteRecognizerFromJson(json);
    Map<String, dynamic> toJson() => _$LegacyBlinkCardEliteRecognizerToJson(this);
}