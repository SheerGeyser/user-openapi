GENERATOR_IMAGE=openapitools/openapi-generator-cli:v7.6.0
SCHEMA_PATH=schema/openapi.yaml
GENERATOR=go-gin-server

.PHONY: generate clean run

generate:
	docker run --rm -v $(PWD):/local \
	  openapitools/openapi-generator-cli:v7.6.0 generate \
	  -i /local/$(SCHEMA_PATH) \
	  -g $(GENERATOR) \
	  -o /local \
	  --git-repo-id user-openapi \
	  --git-user-id SheerGeyser

clean:
	find . -mindepth 1 ! -name 'schema' ! -name 'Makefile' -exec rm -rf {} +

run:
	docker run --rm -v $(PWD):/app -w /app golang:1.21 \
	  bash -c "go mod init generated || true && go mod tidy && go run main.go"
