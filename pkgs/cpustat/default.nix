{ stdenv, lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "cpustat";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "zhesnaile";
    repo = "cpustat";
    rev = "v${version}";
    sha256 = "8ysXrWmk/+ZT5qryqP3lHL2DbKmW1B24xW+kC3kp/OM=";
  };
  vendorHash = null;

  meta = with lib; {
    description = "Monitor CPU clocks on a linux system.";
    homepage = "https://github.com/zhesnaile/cpustat";
    license = licenses.mit;
    platforms = platforms.linux;
  };

}
