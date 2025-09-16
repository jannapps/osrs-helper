{
  description = "Rails development environment with SQLite";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        # Use legacyPackages for efficient lazy evaluation of nixpkgs' 80,000+ packages
        # (packages attribute would be too slow for something this large)
        pkgs = nixpkgs.legacyPackages.${system};
        
        # Ruby gems environment using bundlerEnv
        rubyEnv = pkgs.bundlerEnv {
          name = "myapp-ruby-env";
          ruby = pkgs.ruby_3_2;
          gemfile = ./Gemfile;
          lockfile = ./Gemfile.lock;
          gemset = ./gemset.nix;
        };

        # Script to start Rails server
        startRails = pkgs.writeShellScriptBin "start-rails" ''
          echo "Starting Rails server on port 3000..."
          bundle exec rails server -p 3000
        '';

        # Script to stop Rails server
        stopRails = pkgs.writeShellScriptBin "stop-rails" ''
          echo "Stopping Rails server..."
          pkill -f "rails server" || echo "No Rails server process found"
        '';
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # Ruby ecosystem
            rubyEnv
            rubyEnv.wrappedRuby
            
            # Database
            sqlite
            
            # Development tools
            git
            curl
            which
            bundler
            bundix  # For updating gemset.nix when Gemfile changes
            
            # Custom scripts
            startRails
            stopRails
          ];
        };
      });
}
