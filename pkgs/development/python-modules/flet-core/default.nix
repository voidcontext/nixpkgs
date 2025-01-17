{ lib
, buildPythonPackage
, fetchPypi

# build-system
, poetry-core

# propagates
, typing-extensions
, repath
}:

buildPythonPackage rec {
  pname = "flet-core";
  version = "0.15.0";
  format = "pyproject";

  src = fetchPypi {
    pname = "flet_core";
    inherit version;
    hash = "sha256-nmQHWyLlyo6CVzn+dlTSnA10XRoSFBLEeYdcWpfoGBo=";
  };

  nativeBuildInputs = [
    poetry-core
  ];

  propagatedBuildInputs = [
    repath
    typing-extensions
  ];

  doCheck = false;

  meta = {
    changelog = "https://github.com/flet-dev/flet/releases/tag/v${version}";
    description = "The library is the foundation of Flet framework and is not intended to be used directly";
    homepage = "https://flet.dev/";
    license = lib.licenses.asl20;
    maintainers = [ lib.maintainers.heyimnova ];
  };
}
