// https://librewolf.net/docs/settings/

// UI config
defaultPref("browser.compactmode.show", true);
defaultPref("browser.uidensity", 1);
defaultPref("browser.tabs.inTitlebar", 0);
defaultPref("toolkit.legacyUserProfileCustomizations.stylesheets", true);

// hardware video decode
defaultPref("media.ffmpeg.vaapi.enabled", true);

// librewolf's defaults are a little over the top for me
defaultPref("privacy.resistFingerprinting", false);
defaultPref("privacy.clearOnShutdown.cache", false);
defaultPref("privacy.clearOnShutdown.cookies", false);
defaultPref("privacy.clearOnShutdown.downloads", false);
defaultPref("privacy.clearOnShutdown.formdata", false);
defaultPref("privacy.clearOnShutdown_v2.cache", false);
defaultPref("privacy.clearOnShutdown_v2.cookiesAndStorage", false);
defaultPref("privacy.clearOnShutdown_v2.historyFormDataAndDownloads", true);
