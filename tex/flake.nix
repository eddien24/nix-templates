{
  description = "A very basic flake";

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
            just
            tectonic
            zathura
            perl538Packages.LatexIndent
          ];

          LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;

          shellHook = ''
            just watch 2>&1 > /dev/null &
            zathura build/default/default.pdf 2>&1 > /dev/null &
            trap "./exit.sh" EXIT
          '';
        };
      }
    );
}
