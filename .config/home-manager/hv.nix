{ lib, fetchFromGitHub, rustPlatform, fetchgit }:

rustPlatform.buildRustPackage rec {
  pname = "hv";
  version = "0.0.1";

  #src = fetchFromGitHub {
  #  owner = "A-Helberg";
  #  repo = pname;
  #  rev = version;
  #  #hash = "sha256-B9zmMU5epDAWrza6XaZtmAVQomqUdKAfpUEu8HwkmhE=";
  #  sha = "fb9a90baa2089f508d545e34cae4e92ecb1c24d0"
  #};

  src = fetchgit {
    url = "https://github.com/A-Helberg/hv.git";
    hash = "sha256-JHTsTEdotzGOahQA1tfQTV82s6OkZnT7LyxKGt34nWY=";
  };

  cargoHash = "sha256-TXwBDEIhtK0v1pw9VQRULbWrX2V7vfbxAdSXhmtmjXo=";

  meta = with lib; {
    description = "like op but for Hashicorp Vault";
    homepage = "https://github.com/A-Helberg/hv";
    license = licenses.unlicense;
    maintainers = [];
  };
}

