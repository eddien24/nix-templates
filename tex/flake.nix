{
  description = "Flake for developing LaTeX using Tectonic, Zathura, and shell hooks";

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
            tectonic
            zathura
            perl538Packages.LatexIndent

            # For treesitter to work 
            tree-sitter
            nodejs_18
          ];

          LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;

          shellHook = ''            \
                        chmod +x exit.sh
                        tectonic -X watch 2>&1 > /dev/null &
                        export TECTONICPID=$!
                        zathura build/default/default.pdf 2>&1 > /dev/null &
                        export ZATHURAPID=$!
                        export EXIT_PATH=$(realpath ./exit.sh)
                        $EDITOR src/index.tex
                        trap $EXIT_PATH EXIT
          '';
        };
      }
    );
}
