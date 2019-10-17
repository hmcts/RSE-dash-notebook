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
		-e http_proxy=$(http_proxy) \
		-e https_proxy=$(https_proxy) \
		-v $(PWD)/workspace:/home/jovyan/work \
		jupyter/scipy-notebook
