# jupyter-airbnb-covid19

This repository contains a jupyter notebook which uses the 
Python Data Analysis Library (pandas) to analize public data from
Inside Airbnb.

Specifically it uses the downloadable data for Berlin in the years 2018 to 2020
to find "traces of COVID-19" in it.

Do not take the questions raised scientifically too serious. The focus is to
show how easy it is to use the pandas library for data analysis.

These are the question we try to answer:

* Is 2020 a year like any other at airbnb?
* Can we find traces of COVID-19 in Inside Airbnb's data?
* Does COVID-19 infect the data?

## Prerequisites

All scripts and python source codes are tested under osx and linux only.

### Get the data

The data is not included in the repository, simply because it is too big.
Please use the script `download_and_extract_data.sh` to download and
extract the data. The resulting files are stored in a new directory called 
`data`.

### Initialize the python environment

You do not want to polute your local environment with new
python libraries. Since the analisis needs a lot of memory (>12Gb) we are not
going to use containers. Instead you should create a virtual python 
environment in the current directory. The only requirement is that python3 is
preinstalled on your local system. Then just run:

```sh
python3 -m venv venv
```

And activate the virtual environment in your current shell:

```sh
source ./venv/bin/activate
```

Now you can install the needed python libraries:

```sh
pip install pandas
pip install jupyterlab
pip install matplotlib
pip install scikit-learn
pip install seaborn
```

## Start and run the jupyter notebook

If all the prerequisites are installed and the correct virtual python
environment is activated you can start a jupyter notebook session in 
your browser from the command line from within the root directory of this
GIT repository:

```sh
jupyter notebook .
```

A new browser tab should open with a listing of all files in this repository.
Just click on the file `airbnb_berlin_covid19.ipynb` to open the notebook
in yet another browser tab.

Jupyter will load in the last state showing all outputs of the last run.
So you can directly see the results. If you want to reevaluate everything
use the menu option `Kernel -> Restart & Run All`.


