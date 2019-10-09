ifndef TAG
  override TAG=19.10.5
endif

ifndef REPOSITORY
  override REPOSITORY=dsanderscan
endif

ifndef IMAGE_NAME
  override IMAGE_NAME=docker-packer-1-4-4
endif

.PHONY: build
build:
	@docker build -t ${REPOSITORY}/${IMAGE_NAME}:${TAG} .

.PHONY: push
push:
	@docker push ${REPOSITORY}/${IMAGE_NAME}:${TAG}

.PHONY: shell
shell:
	@docker run \
		--rm \
		-it \
		--entrypoint=/bin/sh \
		${REPOSITORY}/${IMAGE_NAME}:${TAG} || true

.PHONY: test
test:
	@/bin/bash tests/unit-tests.sh "${REPOSITORY}/${IMAGE_NAME}:${TAG}"