import '../overlay_settings.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blinkcard_overlays.g.dart';

/// Class for setting up BlinkCard overlay.
/// BlinkCard overlay is best suited for scanning payment cards.
@JsonSerializable()
class BlinkCardOverlaySettings extends OverlaySettings {
    /// String: user instructions that are shown above camera preview while the first side of the
    /// document is being scanned.
    /// If null, default value will be used.
    String firstSideInstructions;

    /// String: user instructions that are shown above camera preview while the second side of the
    /// document is being scanned.
    /// If null, default value will be used.
    String flipCardInstructions;

    /// Defines whether glare warning will be displayed when user turn on a flashlight
    /// Default true
    bool showFlashlightWarning;

    BlinkCardOverlaySettings(): super('BlinkCardOverlaySettings');

    factory BlinkCardOverlaySettings.fromJson(Map<String, dynamic> json) => _$BlinkCardOverlaySettingsFromJson(json);

    Map<String, dynamic> toJson() => _$BlinkCardOverlaySettingsToJson(this);
}
