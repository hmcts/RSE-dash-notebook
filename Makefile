include .env

.PHONY: notebook
notebook:
	@docker run \
		--name notebook \
		--rm \
		-p 10000:8888 \
		-e JUPYTER_ENABLE_LAB=yes \
		-e endpoint=$(endpoint) \
		-e masterKey=$(masterKey) \
		-e databaseId=$(databaseId) \
		-e containerId=$(containerId) \
		-v $(PWD)/workspace:/home/jovyan/work \
		jupyter/scipy-notebook
