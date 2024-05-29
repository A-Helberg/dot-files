{ lib, fetchFromGitHub, buildGoModule, nomad }:

buildGoModule rec {
  pname = "nomad-pack";
  version = "v0.1.1";

  src = fetchFromGitHub {
    owner = "hashicorp";
    repo = pname;
    rev = version;
    hash = "sha256-b7M2I+R39txtTdk/FOYvKfZxXbGEtDrzgpB64594Gqc=";
  };

  doCheck = false;

  vendorHash = "sha256-bhWySn5p1aPbYSCY7GqFteYmm22Jeq/Rf/a2ZTjyZQ4=";

  meta = with lib; {
    description = "Nomad Pack is a templating and packaging tool used with HashiCorp Nomad.";
    homepage = "https://github.com/hashicorp/nomad-pack";
    license = licenses.unlicense;
    maintainers = [];
  };
}
