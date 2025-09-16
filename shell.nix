# this shell.nix is for bootstrapping the dev environment
# that is, generating Gemfile.lock, gemset.nix, etc
# it's activated by running nix-shell and is not necessary once the flake is set up correctly

{ pkgs ? import <nixpkgs> {} }:

# ruby platform gems are necessary for these particular dependency sets
# without this option, there'll be hash mismatch in fixed-output derivation errors
let
  bundleConfig = pkgs.writeTextDir ".bundle/config" ''
    ---
    BUNDLE_FORCE_RUBY_PLATFORM: "true"
  '';
in

# provide necessary stuff for building ruby gems
pkgs.mkShell {
  buildInputs = with pkgs; [
    ruby_3_2
    bundler
    bundix
    gcc
    binutils
    gnumake
    pkg-config
    # other dependencies
    openssl
    zlib
    libffi
  ];

# shellhook to link the file specified above to the project's filesystem
# can't provide the file directly because the project's fs is considered readonly to nix
  shellHook = ''
    ln -sf ${bundleConfig}/.bundle .bundle
  '';
}
