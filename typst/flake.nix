{
  description = "Typst flake";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    utils,
  }:
    utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
      in {
        devShells.default = pkgs.mkShell rec {
          buildInputs = with pkgs; [
            typst
            typstyle
            tinymist
            zathura 
            tmux
          ];

          LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;

          shellHook = ''
            chmod +x exit.sh
            tmux new-session -ds typst "typst watch main.typ main.pdf"
            zathura main.pdf 2>&1 > /dev/null &
            export ZATHURAPID=$!
            export EXIT_PATH=$(realpath ./exit.sh)
            $EDITOR main.typ
            trap $(echo $EXIT_PATH) EXIT
          '';
        };
      }
    );
}
