# A wrapper to build neofob/linux-utils docker image
#
# __author__: tuan t. pham

DOCKER_IMG ?= neofob/linux-utils
DOCKER_TAG ?= latest

docker:
	docker build -t ${DOCKER_IMG}:${DOCKER_TAG} .
