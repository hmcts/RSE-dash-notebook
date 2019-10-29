include .env

.DEFAULT_GOAL := notebook
.image_tag = hmcts/jupyter-notebook
.docker_port = 8888
.common_docker_args = \
	--rm \
	-e JUPYTER_ENABLE_LAB=yes \
	-e endpoint=$(endpoint) \
	-e masterKey=$(masterKey) \
	-e databaseId=$(databaseId) \
	-e containerId=$(containerId) \
	-v $(PWD)/work:/home/jovyan/work

.PHONY: jupyter-image ## Build the Jupyter Notebook image
jupyter-image:
	@docker build \
		-t $(.image_tag) \
		.

.PHONY: docs ## Regenerate the docs
docs: jupyter-image
	@rm -rf docs/*
	@docker run \
		$(.common_docker_args) \
		-v $(PWD)/docs:/home/jovyan/docs \
		-v $(PWD)/scripts:/home/jovyan/scripts \
		$(.image_tag) ./scripts/export-doc

.PHONY: notebook ## Start the notebook
notebook: jupyter-image
	@docker run \
		-p $(.docker_port):8888 \
		$(.common_docker_args) \
		$(.image_tag)
