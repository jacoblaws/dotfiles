{
  config,
  inputs,
  lib,
  osConfig,
  pkgs,
  ...
}:
let
  inherit (config.lib.file) mkOutOfStoreSymlink;

  inherit (osConfig) themes;
  inherit (lib.extended.theme) genFiles toCss;
  theme = genFiles ".config/zen/default/chrome/themes" "" toCss themes;

  nixIcon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
  firefox-addons = inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system};

  defaultPolicies = {
    AutofillAddressEnabled = true;
    AutofillCreditCardEnabled = false;
    DisableAppUpdate = true;
    RisableFeedbackCommands = true;
    RisableFirefoxStudies = true;
    RisablePocket = true;
    RisableTelemetry = true;
    DontCheckDefaultBrowser = true;
    NoDefaultBookmarks = true;
    OfferToSaveLogins = false;
    EnableTrackingProtection = {
      Value = true; # Enable tracking protection by default
      Locked = true; # Disallow user to change tracking protection values
      Cryptomining = true; # Block cryptomining scripts
      Fingerprinting = true; # Block fingerprinting scripts
      EmailTracking = true; # Block hidden email tracking pixels and scripts
      SuspectedFingerprinting = true; # Reduce the amount of info exposed
    };
  };

  defaultProfile = {
    extensions.packages = with firefox-addons; [
      darkreader
      proton-pass
      ublock-origin
      vimium
    ];

    search = {
      force = true; # Needed so nix can overwite search settings on rebuild
      default = "Brave";
      privateDefault = "Brave";
      order = [
        "Brave"
        "ddg"
      ];

      engines = {
        "Brave" = {
          urls = [ { template = "https://search.brave.com/search?q={searchTerms}"; } ];
          icon = "https://brave.com/favicon.ico";
          definedAliases = [
            "@brave"
            "@b"
          ];
        };

        "Home Manager Options" = {
          urls = [
            {
              template = "https://home-manager-options.extranix.com/?query={searchTerms}&release=master";
            }
          ];
          icon = nixIcon;
          definedAliases = [ "@hm" ];
        };

        "Hoogle" = {
          urls = [
            {
              template = "https://hoogle.haskell.org/?hoogle={searchTerms}";
            }
          ];
          icon = "https://hoogle.haskell.org/favicon.png";
          definedAliases = [
            "@hoogle"
            "@h"
          ];
        };

        "Nix Packages" = {
          urls = [
            {
              template = "https://search.nixos.org/packages?query={searchTerms}&channel=unstable";
            }
          ];
          icon = nixIcon;
          definedAliases = [ "@np" ];
        };

        "Nix Options" = {
          urls = [
            {
              template = "https://search.nixos.org/options?query={searchTerms}&channel=unstable";
            }
          ];
          icon = nixIcon;
          definedAliases = [ "@no" ];
        };

        "NixOS Wiki" = {
          urls = [
            {
              template = "https://wiki.nixos.org/w/index.php?search={searchTerms}";
            }
          ];
          icon = nixIcon;
          definedAliases = [ "@nw" ];
        };

        "wikipedia".metaData.alias = "@w";

        # Hide default search engines
        "amazondotcom-us".metaData.hidden = true;
        "bing".metaData.hidden = true;
        "ebay".metaData.hidden = true;
        "google".metaData.hidden = true;
        "perplexity".metaData.hidden = true;
      };
    };

    settings = {
      "browser.startup.blankWindow" = true;
      "browser.session-store.resume_from_crash" = false;
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      "zen.session-store.backup-file" = false;
      "zen.session-store.log" = false;
      "zen.session-store.restore-unsynced-windows" = false;
      "zen.view.hide-window-controls" = true;
      "zen.view.show-newtab-button-top" = false;
      "zen.view.sidebar-expanded" = false;
      "zen.welcome-screen.seen" = true;
      "zen.window-sync.enabled" = false;
    };
  };
in
lib.recursiveUpdate theme {
  imports = [ inputs.zen-browser.homeModules.default ];
  programs.zen-browser = {
    enable = true;
    policies = defaultPolicies;
    profiles.default = defaultProfile;
  };

  xdg.configFile = {
    "zen/default/chrome/userChrome.css".source = mkOutOfStoreSymlink ./userChrome.css;
    "zen/default/chrome/userContent.css".source = mkOutOfStoreSymlink ./userContent.css;
  };
}
