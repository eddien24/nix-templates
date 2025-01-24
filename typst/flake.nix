{
  description = "Typst flake";
  inputs.utils.url = "github:numtide/flake-utils";

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
          ];

          LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;

          shellHook = ''
            chmod +x exit.sh
            tmux new-session -ds typst "typst watch main.typ main.pdf"
            zathura main.pdf 2>&1 > /dev/null &
            export ZATHURAPID=$!
            $EDITOR main.typ
            trap "./exit.sh" EXIT
          '';
          # shellHook = ''            \
          #               chmod +x exit.sh
          #               typst watch main.typ main.pdf 2>&1 > /dev/null &
          #               export TYPSTPID=$!
          #               zathura main.pdf 2>&1 > /dev/null &
          #               export ZATHURAPID=$!
          #               $EDITOR main.typ
          #               trap "./exit.sh" EXIT
          # '';
        };
      }
    );
}
