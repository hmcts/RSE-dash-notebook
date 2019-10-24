FROM jupyter/scipy-notebook

RUN \
    # Install additional dependencies used in the scripts
    pip install \
    azure-cosmos \
    "plotly==4.2.1" \
    "jupyterlab==1.0" \
    "ipywidgets==7.5" \
    "notebook>=5.3" \
    # Avoid "JavaScript heap out of memory" errors during extension installation
    && export NODE_OPTIONS=--max-old-space-size=4096 \
    && npm set strict-ssl false \
    \
    # Jupyter widgets extension
    && jupyter labextension install @jupyter-widgets/jupyterlab-manager@1.0 --no-build \
    \
    # jupyterlab renderer support
    && jupyter labextension install jupyterlab-plotly@1.1.0 --no-build \
    \
    # FigureWidget support
    && jupyter labextension install plotlywidget@1.1.0 --no-build \
    \
    # JupyterLab chart editor support (optional)
    && jupyter labextension install jupyterlab-chart-editor --no-build \
    \
    # Build extensions (must be done to activate extensions since --no-build is used above)
    && jupyter lab clean \
    && jupyter lab build \
    \
    # Unset NODE_OPTIONS environment variable
    && unset NODE_OPTIONS
