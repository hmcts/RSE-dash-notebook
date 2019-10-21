include .env

.DEFAULT_GOAL := notebook

.docker_port = 8888
.common_docker_args = \
	--rm \
	-e JUPYTER_ENABLE_LAB=yes \
	-e endpoint=$(endpoint) \
	-e masterKey=$(masterKey) \
	-e databaseId=$(databaseId) \
	-e containerId=$(containerId) \
	-v $(PWD)/workspace:/home/jovyan/work \
	-v $(PWD)/before-notebook.d:/usr/local/bin/before-notebook.d/

.PHONY: doc
doc:
	@docker run \
		$(.common_docker_args) \
		-v $(PWD)/docs:/home/jovyan/docs \
		-v $(PWD)/scripts:/home/jovyan/scripts \
		jupyter/scipy-notebook ./scripts/export-doc

.PHONY: notebook
notebook:
	@docker run \
		-p $(.docker_port):8888 \
		$(.common_docker_args) \
		jupyter/scipy-notebook
