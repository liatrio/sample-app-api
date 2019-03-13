OS := $(shell uname)

preview: 
ifeq ($(OS),Darwin)
	sed -i "" -e "s/version:.*/version: $(VERSION)/" Chart.yaml
	sed -i "" -e "s/version:.*/version: $(VERSION)/" ../*/Chart.yaml
	sed -i "" -e "s/tag:.*/tag: $(VERSION)/" values.yaml
else ifeq ($(OS),Linux)
	sed -i -e "s/version:.*/version: $(VERSION)/" Chart.yaml
	sed -i -e "s/version:.*/version: $(VERSION)/" ../*/Chart.yaml
	sed -i -e "s|repository:.*|repository: $(DOCKER_REGISTRY)\/liatrio\/sample-app-api|" values.yaml
	sed -i -e "s/tag:.*/tag: $(VERSION)/" values.yaml
else
	echo "platfrom $(OS) not supported to release from"
	exit -1
endif
	echo "  version: $(VERSION)" >> requirements.yaml
	jx step helm build
