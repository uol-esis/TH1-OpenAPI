UID=$(id -u)
GID=$(id -g)

docker run --rm \
  -u "${UID}":"${GID}" \
  -v "${PWD}":/local openapitools/openapi-generator-cli:v7.12.0 generate \
  -i /local/openapi.yaml \
  -g spring \
  --additional-properties=useSpringBoot3=true \
  -o /local/target
