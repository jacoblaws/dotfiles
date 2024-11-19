_default: help

[group('Update Configuration')]
[doc('Rebuild system-level configs')]
system:
  nh os switch

[group('Update Configuration')]
[doc('Rebuild user-level configs')]
home:
  nh home switch

[group('Update Configuration')]
[doc('Update flake inputs')]
flake:
  nix flake update

[group('Update Configuration')]
[doc('Update all configs: flake -> system -> home')]
update-all: flake system home

[group('Misc. Helper Recipes')]
[doc('List all recipes (or just run `just`)')]
help:
  @just --list --unsorted

[group('Misc. Helper Recipes')]
[doc('Open home-manager man page')]
manhm:
  man home-configuration.nix
