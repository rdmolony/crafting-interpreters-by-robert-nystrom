 let
   pkgs = import <nixpkgs> {};
   dart-sources = rec {
     version = "2.19.6";
     "${version}-x86_64-linux" = pkgs.fetchurl {
        url = "https://storage.googleapis.com/dart-archive/channels/stable/release/${version}/sdk/dartsdk-linux-x64-release.zip";
        sha256 = "0kvhvwd2q8s7mnjgvhl6gr3y73agcd0y79sm844xd8ybd9gg5pqg";
     };
   };
   dart = pkgs.dart.override { sources = dart-sources; version = dart-sources.version; };
 in
 pkgs.mkShellNoCC {
   packages = [
     dart
   ];
 }