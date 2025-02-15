GENERATOR_IMAGE=openapitools/openapi-generator-cli:v7.6.0
SCHEMA_PATH=schema/openapi.yaml
OUTPUT_PATH=generated
GENERATOR=go-gin-server

.PHONY: generate clean run

generate:
	docker run --rm -v $(PWD):/local -v $(PWD)/generated:/generated \
      openapitools/openapi-generator-cli:v7.6.0 generate \
      -i /local/schema/openapi.yaml \
      -g go-gin-server \
      -o /generated \
      --git-repo-id user-openapi \
      --git-user-id SheerGeyser
clean:
	rm -rf $(OUTPUT_PATH)

run:
	docker run --rm -v $(PWD)/$(OUTPUT_PATH):/app -w /app golang:1.21 \
	  bash -c "go mod init generated || true && go mod tidy && go run main.go"
