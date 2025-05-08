UID=$(id -u)
GID=$(id -g)

docker run --rm \
  -u "${UID}":"${GID}" \
  -v "${PWD}":/local openapitools/openapi-generator-cli:v7.13.0 generate \
  -i /local/openapi.yaml \
  -g spring \
  --api-package de.uol.pgdoener.th1.api \
  --model-package de.uol.pgdoener.th1.model \
  --additional-properties=generate-model-tests=false \
  --additional-properties=generate-api-tests=false \
  --additional-properties=add-compile-source-root=false \
  --model-name-suffix=Dto \
  --additional-properties=configPackage=de.uol.pgdoener.th1.config \
  --additional-properties=enumDefaultCase=true \
  --additional-properties=useSpringBoot3=true \
  --additional-properties=delegatePattern=true \
  --additional-properties=booleanGetterPrefix=is \
  --additional-properties=useOptional=true \
  -o /local/target/server
