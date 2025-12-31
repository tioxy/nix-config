{ config, pkgs, ... }: {
  system = {
    activationScripts.extraActivation.text = ''
      # Enable Bluetooth debugging
      /usr/bin/defaults write /Library/Preferences/com.apple.Bluetooth.plist EnableBluetoothDebugLogs 1
      /usr/bin/defaults write /Library/Preferences/com.apple.Bluetooth.plist EnableTailLog 1
    '';

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
  };
}
