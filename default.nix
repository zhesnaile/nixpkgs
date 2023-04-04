{ pkgs ? import <nixpkgs> { } }:

pkgs.lib.makeExtensible (self: {
  cpustat = pkgs.callPackage ./pkgs/cpustat { };
})
