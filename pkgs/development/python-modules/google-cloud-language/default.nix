{ lib
, buildPythonPackage
, fetchPypi
, google-api-core
, proto-plus
, protobuf
, pytest-asyncio
, pytestCheckHook
, pythonOlder
}:

buildPythonPackage rec {
  pname = "google-cloud-language";
  version = "2.11.0";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ldI19QPZBOiFQRfpKO82rJMMJIJfy4QAw/NoqQj9vhQ=";
  };

  propagatedBuildInputs = [
    google-api-core
    proto-plus
    protobuf
  ] ++ google-api-core.optional-dependencies.grpc;

  nativeCheckInputs = [
    pytestCheckHook
    pytest-asyncio
  ];

  pythonImportsCheck = [
    "google.cloud.language"
    "google.cloud.language_v1"
    "google.cloud.language_v1beta2"
  ];

  meta = with lib; {
    description = "Google Cloud Natural Language API client library";
    homepage = "https://github.com/googleapis/python-language";
    changelog = "https://github.com/googleapis/python-language/blob/v${version}/CHANGELOG.md";
    license = licenses.asl20;
    maintainers = with maintainers; [ ];
  };
}
