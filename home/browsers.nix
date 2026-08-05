{
  lib,
  self,
  ...
}:
let
  cfgFirefoxBased =
    pkgs: browserPkg:
    let
      # nixIcon = pkgs: "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";

      genPrefs =
        prefs:
        lib.concatLines (
          lib.mapAttrsToList (
            name: value: "lockPref(${lib.strings.toJSON name}, ${lib.strings.toJSON value});"
          ) prefs
        );

      extensions =
        let
          extension = shortId: guid: {
            name = guid;
            value = {
              install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
              installation_mode = "normal_installed";
              private_browsing = true;
              updates_disabled = true;
            };
          };
        in
        [
          (extension "ublock-origin" "uBlock0@raymondhill.net")
          (extension "darkreader" "addon@darkreader.org")
          (extension "proton-pass" "78272b6fa58f4a1abaac99321d503a20@proton.me")
          (extension "vimium-ff" "{d7742d87-e61d-4b78-b8a1-b469842139fa}")
        ];
    in
    (pkgs.wrapFirefox browserPkg {
      extraPolicies = {
        ExtensionSettings = builtins.listToAttrs extensions // {
          "*".installation_mode = "blocked";
        };

        AutofillAddressEnabled = true;
        AutofillCreditCardEnabled = false;
        DisableAppUpdate = true;
        DisableFeedbackCommands = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
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

        SearchEngines = {
          Default = "Brave";
          PreventInstalls = true;
          Add = [
            {
              Name = "Brave";
              URLTemplate = "https://search.brave.com/search?q={searchTerms}";
              IconURL = "https://brave.com/favicon.ico";
              Alias = "@b";
            }
            {
              Name = "Hoogle";
              URLTemplate = "https://hoogle.haskell.org/?hoogle={searchTerms}";
              Alias = "@h";
            }
            {
              Name = "Nix Packages";
              URLTemplate = "https://search.nixos.org/packages?query={searchTerms}&channel=unstable";
              Alias = "@np";
            }
            {
              Name = "Nix Options";
              URLTemplate = "https://search.nixos.org/options?query={searchTerms}&channel=unstable";
              Alias = "@no";
            }
            {
              Name = "NixOS Wiki";
              URLTemplate = "https://wiki.nixos.org/w/index.php?search={searchTerms}";
              Alias = "@nw";
            }
          ];

          Remove = [
            "Amazon.com"
            "Bing"
            "DuckDuckGo"
            "Google"
            "Perplexity"
            "Wikipedia (en)"
            "eBay"
          ];
        };
      };

      extraPrefs = genPrefs {
        "browser.startup.blankwindow" = true;
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
    });

  # SearchEngines = {
  #   Default = "Brave";
  #   PrivateDefault = "Brave";
  #   Order = [
  #     "Brave"
  #     "ddg"
  #   ];
  #
  #   Add = [
  #     {
  #       name = "Brave";
  #       template = "https://search.brave.com/search?q={searchTerms}";
  #       icon = "https://brave.com/favicon.ico";
  #       aliases = [
  #         "@brave"
  #         "@b"
  #       ];
  #     }
  #     {
  #       name = "Home Manager Options";
  #       template = "https://home-manager-options.extranix.com/?query={searchTerms}&release=master";
  #       aliases = [ "@hm" ];
  #     }
  #     {
  #       name = "Hoogle";
  #       template = "https://hoogle.haskell.org/?hoogle={searchTerms}";
  #       aliases = [
  #         "@hoogle"
  #         "@h"
  #       ];
  #     }
  #     {
  #       name = "Nix Packages";
  #       template = "https://search.nixos.org/packages?query={searchTerms}&channel=unstable";
  #       aliases = [ "@np" ];
  #     }
  #     {
  #       name = "Nix Options";
  #       template = "https://search.nixos.org/options?query={searchTerms}&channel=unstable";
  #       aliases = [ "@no" ];
  #     }
  #     {
  #       name = "NixOS Wiki";
  #       template = "https://wiki.nixos.org/w/index.php?search={searchTerms}";
  #       aliases = [ "@nw" ];
  #     }
  #   ];
  # };
in
{
  flake.nixosModules.browsers = {
    imports = with self.nixosModules; [
      chromium
      firefox
      zen
    ];
  };

  flake.nixosModules.chromium = { pkgs, ... }: {
    programs.chromium = {
      enable = true;
      extensions = [
        "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark Reader
      ];
    };

    hjem.users.jvl.packages = [ pkgs.brave ];
  };

  flake.nixosModules.firefox = { pkgs, ... }: {
    hjem.users.jvl = {
      packages = [ (cfgFirefoxBased pkgs pkgs.firefox-unwrapped) ];
    };
  };

  flake.nixosModules.zen =
    {
      cfgPath,
      pkgs,
      themes,
      utl,
      ...
    }:
    {
      hjem.users.jvl = {
        packages = [ (cfgFirefoxBased pkgs pkgs.zen-browser) ];
        xdg.config.files = {
          "zen/default/chrome/userChrome.css".source = cfgPath "zen/userChrome.css";
          "zen/default/chrome/userContent.css".source = cfgPath "zen/userContent.css";
          "zen/default/chrome/themes/everforest-dark".text = utl.theme.toCss themes.everforest.dark;
          "zen/default/chrome/themes/everforest-light".text = utl.theme.toCss themes.everforest.light;

          "zen/profiles.ini".text = # ini
            ''
              [Profile0]
              Name=default
              IsRelative=1
              Path=default
              Default=1

              [General]
              StartWithLastProfile=1
              Version=2
            '';
        };
      };
    };
}
