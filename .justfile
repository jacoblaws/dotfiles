_default: help

[group('Build Configuration')]
[doc('Build, activate, and make the new configuration the boot default')]
switch:
  nh os switch .

[group('Build Configuration')]
[doc('Build and activate the new configuration')]
test:
  nh os test .

[group('Build Configuration')]
[doc('Build the new configuration')]
build:
  nh os build .

[group('Update Configuration')]
[doc('Update flake inputs')]
flake:
  nix flake update .

[group('Update Configuration')]
[doc('Update flake inputs and switch to new configuration')]
update: flake switch

[group('Misc. Helper Recipes')]
[doc('List all recipes (or just run `just`)')]
help:
  @just --list --unsorted

[group('Misc. Helper Recipes')]
[doc('Open home-manager man page')]
manhm:
  man home-configuration.nix
