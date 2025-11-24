{
    inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    outputs = {
        self,
        nixpkgs,
    }: let
        system = "x86_64-linux";
        pkgs = import nixpkgs {inherit system;};
        lib = pkgs.lib;
    in {
        devShells.${system}.default = pkgs.mkShell rec {
            NIX_ENFORCE_PURITY = 0;
            LD_LIBRARY_PATH = lib.makeLibraryPath buildInputs;

            packages = with pkgs; [
                zsh
                nodejs
            ];

            # Packages necessary to only Build the project
            nativeBuildInputs = with pkgs; [
            ];

            # Packages necessary for Running the Built program and or Building
            buildInputs = with pkgs; [
                cairo
                gdk-pixbuf
                glib
                dbus
                librsvg
                curl
                wget
                pkg-config
                dbus
                openssl
                glib
                gtk3
                libsoup_3
                librsvg
                nodejs
                webkitgtk_4_1
            ];

            shellHook = ''
                export SHELL=${pkgs.zsh}/bin/zsh
                exec zsh;
            '';
        };
    };
}
