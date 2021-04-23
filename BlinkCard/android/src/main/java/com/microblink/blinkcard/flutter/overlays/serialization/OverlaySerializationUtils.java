package com.microblink.blinkcard.flutter.overlays.serialization;

import com.microblink.blinkcard.uisettings.UISettings;
import com.microblink.blinkcard.uisettings.options.BeepSoundUIOptions;
import com.microblink.blinkcard.uisettings.CameraSettings;
import com.microblink.blinkcard.hardware.camera.CameraType;
import com.microblink.blinkcard.flutter.R;

import org.json.JSONObject;

public abstract class OverlaySerializationUtils {
    public static void extractCommonUISettings(JSONObject jsonOverlaySettings, UISettings uiSettings) {
        if (uiSettings instanceof BeepSoundUIOptions) {
            if (jsonOverlaySettings.optBoolean("enableBeep", false)) {
                ((BeepSoundUIOptions)uiSettings).setBeepSoundResourceID(R.raw.beep);
            }
        }

        if (jsonOverlaySettings.optBoolean("useFrontCamera", false)) {
            CameraSettings cameraSettings = new CameraSettings.Builder()
                    .setType(CameraType.CAMERA_FRONTFACE)
                    .build();
            uiSettings.setCameraSettings(cameraSettings);
        }
    }
}