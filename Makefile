DIR := $(patsubst %/,%,$(dir $(abspath $(lastword ${MAKEFILE_LIST}))))

# The path to the root of the Git repo
ROOT         ?= ${DIR}
# The path to the mkdocs.yml file, relative to ${ROOT}
DOCS         ?= ./
# The path to the Dockerfile
DOCKERFILE   ?= ${ROOT}/${DOCS}/Dockerfile
# The port on which to serve the documentation on localhost
PORT         ?= 8000
# The path to the tools/ directory, relative to ${DOCS}
TOOLS        ?= tools/
# The path to the requirements.txt file, relative to ${DOCS}
REQUIREMENTS ?= requirements.txt
# The Researchr bibliography to get
RESEARCHR    ?= metaborg-spoofax
# The path to where the Researchr bibliography should be stored
BIB_FILE     ?= $(ROOT)/bibliographies/spoofax.bib
# The path where Makefile.inc lives
include ${DIR}/Makefile.inc
