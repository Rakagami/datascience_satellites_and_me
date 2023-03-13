# Data Science, Satellites, and Me

This is a collection of notebooks and python code related to Satellites.

## Overview

- **Satellite Orbit Display**
	- `orbit_display.ipynb`

- **Satellite Coverage Analysis**
	- `coverage_analysis.ipynb`

- **General Maps related notebook**
    - `maps.ipynb`

- **Scraping Collection**
    - **SatNOG Scraping & Evaluation**
    	- `satnogs.ipynb`
    
    - **fcc.report Scraping & Evaluation**
    	- `scrape_fcc.ipynb`
    
    - **Gunter's Space Page Scraping & Evaluation**
    	- `gsp_scraper.ipynb`

- **Satellite Catalogue (Satcat), Celestrak Constellation Data Evaluation**
	- `notebook.ipynb`
	- `constellations.ipynb`
	- `constellations_preview.ipynb`

- **M-Lab Data Evaluation**
	- see [M-Lab](https://www.measurementlab.net/data/)
	- `mlab.ipynb`

## Quick Start

System Requirements:
- Python 3.10
- libgeos-dev (for cartopy)

```bash
cd /path/to/project
python3 -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install -r ./requirements.txt
./run.sh
```
