SELF_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

ROOT_DIR     := $(SELF_DIR).
DOCKER_IMAGE ?= metaborg/spoofax-docs
DOCKER_FILE  ?= ${ROOT_DIR}/Dockerfile
RESEARCHR    ?= metaborg-spoofax
BIB_FILE     ?= $(ROOT_DIR)/bibliographies/spoofax.bib

# SSH Agent Socket
ifeq ($(OS),Windows_NT)         # WSL2 (Windows)
    SSH_AGENT_SOCK := ${SSH_AUTH_SOCK}
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Darwin)    # macOS
        SSH_AGENT_SOCK := /run/host-services/ssh-auth.sock
    else                        # Linux
        SSH_AGENT_SOCK := ${SSH_AUTH_SOCK}
    endif
endif

# Runs Docker with the specified image,
# mounting the docs directory
# mounting the known_hosts (for GitHub authentication)
# mounting the SSH agent socket (for GitHub authentication)
BASE_COMMAND := docker run --rm -it -p 8000:8000 \
  -v ${ROOT_DIR}:/docs \
  -v ~/.ssh/known_hosts:/root/.ssh/known_hosts \
  -v ${SSH_AGENT_SOCK}:/ssh-agent --env SSH_AUTH_SOCK=/ssh-agent \
  ${DOCKER_IMAGE}

serve: build-image
	$(BASE_COMMAND) serve --dev-addr=0.0.0.0:8000

new: build-image
	$(BASE_COMMAND) new $(ROOT_DIR)

build: build-image
	$(BASE_COMMAND) build

deploy: build-image
	$(BASE_COMMAND) gh-deploy --force

help: build-image
	$(BASE_COMMAND) -h

build-image: Dockerfile
	docker build -t ${DOCKER_IMAGE} -f ${DOCKER_FILE} ${ROOT_DIR}

bib: clean-bib $(BIB_FILE)
$(BIB_FILE): download-bib fix-bib

download-bib:
	curl "https://researchr.org/downloadbibtex/bibliography/$(RESEARCHR)" -o $(BIB_FILE)

fix-bib:
	sed -i '' '1 s/^/% /' $(BIB_FILE)
	sed -i '' 's/doi = {http.*\/\(10\..*\)}/doi = {\1}/' $(BIB_FILE)
	sed -i '' '/doi = {http.*}/d' $(BIB_FILE)
	sed -i '' 's/\&uuml;/ü/' $(BIB_FILE)

clean-bib:
	rm -f $(BIB_FILE)

.PHONY: serve new build deploy help build-image bib download-bib fix-bib clean-bib
.SILENT:
