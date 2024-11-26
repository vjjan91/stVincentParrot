## Passive acoustic monitoring of the St. Vincent's parrot

<!-- badges: start -->

[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active) <!-- badges: end -->

This repository is associated with a UNDP funded project to monitor the endemic St. Vincent's parrot across St. Vincent and the Grenadines.

Please reach out to the repository owner if you have questions.

### [Readable version](https://vjjan91.github.io/stVincentParrot/)

If you would like to see how we co-created the study design (alongside the forestry department of St. Vincent and the Grenadines) to monitor the St. Vincent's parrot, please click on the heading above.

### Workshop materials

A workshop on passive acoustic monitoring was conducted between Nov 4th 2024 to Nov 9th 2024 and associated materials are available by visiting the `workshop` folder.

### Source code for the analyses

We describe what each script (`.Rmd`) of this repository is intended to achieve below.

-   *01_site-selection.Rmd:*. This script is intended to showcase how we co-created a study design with the forestry department of St. Vincent and the Grenadines. Please visit the Readable version above to view associated maps.

### Data

The `data/` folder contains the following datasets required to reproduce the above scripts.

-   `/elevation`: This folder contains high-resolution elevation data, which was downloaded from <https://opentopography.org/>

-   `/spatial`: This folder contains a list of shapefiles that are used by the forestry department.

-   `survey_locations.csv`: Contains the list of sites across which audio recorders are currently being deployed (*Note: this file will be updated after fieldwork*)

-   `survey_pointAttributes.csv`: This .csv was generated during the workshop on Nov 4th and Nov 5th 2024 and includes associated attributes for points chosen for audio recorder deployment.

### Attribution

To cite this repository:

Ramesh, Vijay (2024). Source code and supplementary material for <edit information here>(version xx). Zenodo. [doi to be added].
