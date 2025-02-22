{
  lib,
  sdl3,
  darwin,
  cmake,
  fetchurl,
  giflib,
  libXpm,
  libjpeg,
  libpng,
  libtiff,
  libwebp,
  stdenv,
  zlib,
}:

let
  inherit (darwin.apple_sdk.frameworks) Foundation;
in
stdenv.mkDerivation (finalAttrs: {
  pname = "sdl3_image";
  version = "3.2.0";

  src = fetchurl {
    url = "https://github.com/libsdl-org/SDL_image/releases/download/release-${finalAttrs.version}/SDL3_image-${finalAttrs.version}.tar.gz";
    hash = "sha256-FpC66nGytN7ZiVEmzdvAOhAAsCfQmaT7RmnE0j1zsZ8=";
  };

  nativeBuildInputs = [
    sdl3
    cmake
  ];

  buildInputs = [
    sdl3
    giflib
    libXpm
    libjpeg
    libpng
    libtiff
    libwebp
    zlib
  ] ++ lib.optionals stdenv.hostPlatform.isDarwin [ Foundation ];

  configureFlags = [
    # Disable dynamically loaded dependencies
    (lib.enableFeature false "jpg-shared")
    (lib.enableFeature false "png-shared")
    (lib.enableFeature false "tif-shared")
    (lib.enableFeature false "webp-shared")
  ];

  strictDeps = true;

  enableParallelBuilding = true;

  meta = {
    description = "SDL image library";
    homepage = "https://github.com/libsdl-org/SDL_image";
    license = lib.licenses.zlib;
    maintainers = lib.teams.sdl.members ++ (with lib.maintainers; [ ]);
    platforms = lib.platforms.unix;
  };
})
