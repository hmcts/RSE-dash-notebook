# Jupyter notebook reports

This projects contains a Jupyter notebook including documents related to software engineering practices.

## Docker setup

### Prerequisites

- Docker
- [Jupyter image documentation](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-scipy-notebook)
- `.env` file as specified in `.env.sample`

### Run the notebook

To start the notebook run `make notebook`.

_Notice_: the initial image build may take a looooong time on this step so be patient:

```
[LabBuildApp] Building jupyterlab assets
```

In the notebook, use the `work/` folder to store or modify files.

### Generate reports

`make docs` will export simplified report in the `/docs` folder.

## License

Project licensed under the MIT License - see LICENSE.md for details
