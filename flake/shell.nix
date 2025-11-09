{ inputs, ... }:
{
  imports = [ inputs.make-shell.flakeModules.default ];

  perSystem =
    { pkgs, config, ... }:
    {
      make-shells.default = {
        stdenv = pkgs.stdenvNoCC;
        packages = [
          pkgs.just
          pkgs.lld
          pkgs.llvm
          config.legacyPackages.hostpkgs.clang
        ];
      };

      make-shells.ci = {
        stdenv = pkgs.stdenvNoCC;
        packages = with pkgs; [
          attic-client
          jq
          nix-eval-jobs
          llvm
        ];
      };
    };
}
