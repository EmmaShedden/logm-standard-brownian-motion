# Standard Brownian motion

## Description
Brownian motion [[1](http://galton.uchicago.edu/~lalley/Courses/313/WienerProcess.pdf), [2](https://en.wikipedia.org/wiki/Brownian_motion)] is a mathematical model for a common physical process which occurs in both the natural world and man-made systems. Common examples include the diffusion of small particles in a liquid or gas (as studied by [Albert Einstein](https://www.aps.org/publications/apsnews/200502/history.cfm)) and the movement of certain economic indices (as studied by [Louis Bachelier](https://en.wikipedia.org/wiki/Louis_Bachelier)). Thus, the simulation of Brownian motions is useful to support understanding of the mathematical process and contribute to its wide-ranging applications.

This repository contains:
- Implementations of the Random Walk (Jupyter Notebook) and Series Representation (MATLAB) simulation methods for standard Brownian motions.
- Implementations of useful algorithms (Python, MATLAB) which our simulations rely on for efficiency over naive approaches.
    - Tests of these implementations against standard library implementations in Scikit and Numpy.
    - These are for learning purposes; the standard library functions are used in our simulation code.
- All installation and usage instructions start in the command line at the top level of this repository.

## Installation

### Python Requirements
- Language version: Any version of Python 3 should work fine.
- Packages: `numpy`, `matplotlib`, `scipy`, `pandas`
- Visualization: Graphics are not supported by default on WSL; this may be an issue on other setups as well. To be able to generate graphs and other visualizations, it may be necessary to set up X-11 forwarding. Consider XLaunch from SourceForge via [VcXsrv](https://sourceforge.net/projects/vcxsrv/) or [Xming](https://sourceforge.net/projects/xming/).

Note for installation: Throughout, you may need to replace `pip` with `pip3` depending on your setup. If your `pip` still points to Python 2 (you can check by running `pip -V`), then use `pip3` instead.

Note for installation: Only tested in WSL2 on VSCode so far, but should work on any other setup.

### Python installation
For `.py` files.
1. Follow [this guide](https://wiki.python.org/moin/BeginnersGuide/Download) to install Python 3.
2. In your command line, run `pip install numpy matplotlib scipy`.
3. If you use WSL/WSL2 on Windows and do not have X-11 forwarding previously set up, follow [this guide](https://stackoverflow.com/questions/61110603/how-to-set-up-working-x11-forwarding-on-wsl2).
    - Any commands that attempt to display graphics will hang if this is not set up, so if you don't care about generating your own graphs and don't want to bother with X-11 forwarding, make sure to comment out any instances of `plt.show()` or `plt.save()` in the Python code.

### Jupyter Notebook Installation
For `.ipynb` files.

#### Option 0 (preferred): Jupyter (in browser)
##### First time setup:
1. Run `pip install conda` if you don't already have it.
2. Run `conda env list`. You should see a `base` environment with a filepath.
3. Run `conda activate base` to activate the virtual environment. Alternatively, you can create and use a different virtual environment for this project.
4. Run `pip install ipykernel ipython jupyter jupyterlab`.
5. Run `python3 -m ipykernel install --user --name=[choose-a-name-related-to-this-project]`. This starts a python kernel, using the current virtual environment, for the  Jupyter notebook to connect to.
6. Run `pip install -U "jupyter-server<2.0.0"`.
7. Run `jupyter notebook`. Check for errors in the output and follow any instructions (e.g. missing packages) depending on your setup. You may need to repeat this command multiple times until all errors are resolved.
    - If you use WSL/WSL2 on Windows, run `jupyter notebook --port=8889 --no-browser` instead.
    - You can safely ignore any prompts related to upgrading to Notebook 7.
    - You can safely ignore most warnings.
8. At the end of the output from the previous command, there will be a block of text like the following. Follow the instructions to open the project directory in Jupyter.
```
[C 22:32:19.671 NotebookApp]

To access the notebook, open this file in a browser:
    file:///home/emshedde/.local/share/jupyter/runtime/nbserver-15057-open.html
Or copy and paste one of these URLs:
    http://localhost:8889/?token=7a40b78e800ac1574c7435815ccb54497ac50eaac846db92
    or http://127.0.0.1:8889/?token=7a40b78e800ac1574c7435815ccb54497ac50eaac846db92
```
9. Code is ready to edit/run within the browser.

##### Subsequent use:
1. Run `conda activate base` to activate the virtual environment. If you created a different venv for this project, activate that (you can check what venvs are available using `conda env list`).
2. Run `jupyter notebook`.
    - Again, if you use WSL/WSL2 on Windows, run `jupyter notebook --port=8889 --no-browser` instead.
3. Follow the instructions to open the project directory in Jupyter.

##### Ending the session:
1. When you're done, make sure to save changes (upper left corner). Close the browser window and return to the command line.
2. Type `Ctrl + C`, then `y` to terminate the Jupyter session.
3. Run `conda deactivate` to deactivate the virtual environment.

Source: [This guide](https://devinschumacher.com/how-to-setup-jupyter-notebook-virtual-environment-vs-code-kernels/).

#### Option 1: Google Colab
1. Upload `.ipynb` files to Google Colab.
2. Set the boolean flag `colab` to `True`.
3. Code is ready to edit/run in Colab. Note that output files are saved into the Colab filesystem.
    - If you wish to save output, you may need to select the option to mount your Google Drive on the left sidebar.

#### Option 2: Jupyter Lab
1. Follow [this guide](https://jupyter.org/install) to install Jupyter Lab.
2. Code is ready to edit/run in the Jupyter Lab IDE. You may need to copy the files into Jupyter Lab.

#### Option 3: Jupyter (in your regular IDE)
1. Install Jupyter by following [this guide](https://jupyter.org/install).
2. If you use WSL/WSL2 on Windows and VSCode, you likely need to install [VSCode Insiders](https://code.visualstudio.com/insiders/), since standard VSCode doesn't support Jupyter notebooks out of the box. 
    - Open VSCode using `code-insiders [path-to-directory]`. Follow the prompts to choose a kernel and install necessary packages. See this [resource](https://stackoverflow.com/questions/60025150/jupyter-notebooks-in-vs-code-using-wsl-2-are-not-working) for more info.
    - If the prompt to install `ipykernel` loops, go to the command line (in the environment you are using as your kernel) and make sure both `ipython` and `ipykernel` are installed.
    - If the prompt to select a kernel hangs, double-check that your `python`, `iPython`, and `ipykernel` installations worked and have the versions you expect. You may need to uninstall, reinstall and upgrade them. Then, click on the WSL-Ubuntu icon in the bottom left corner -> Connect to WSL using Distro -> Select the default distro -> Navigate to the top level of the repository and open it.
3. Code is ready to edit/run in VSCode via the `code` command (or VSCode Insiders via the `code-insiders` command).

### MATLAB Requirements

- For `.m` files
- Language version: R2018a and later versions should work fine.
- Note all MATLAB files follow [this style guide](https://sites.google.com/site/matlabstyleguidelines/naming-conventions/variables). (TODO)

### MATLAB Installation

Login to [Mathworks](https://www.mathworks.com/downloads/) and download the desired version.
- If you are affiliated with an educational institution, you might have been granted a license for downloading. Remember to use the email address of that institution when logging in. Otherwise, you need to select a license when downloading it to your desktop. You can either [buy a license](https://www.mathworks.com/pricing-licensing.html?s_tid=srchtitle_license_1) or [apply for a 30-day free trial](https://www.mathworks.com/campaigns/products/trials.html) on the official website.
- You will be asked to select the products you need when downloading. It will be enough for this repo to only select MATLAB.

## Usage (TODO)
Usage instructions for all programs within this repository. Make sure you have completed the relevant installation for the files you want to run.

All instructions begin in the command line at the top level of the repo.

### LU Decomposition in Python
1. Run `cd lu-decomp/`.
2. Run `python main.py`.
    - Depending on your setup, you might need to run `python3` instead.
3. The code first tests the output LU decomposition of a hardcoded matrix, then on randomly generated matrices. Not every matrix has an LU decomposition; when our algorithm cannot find one, it raises an exception. Therefore, the output will reflect the number of randomly generated matrices which admitted LU decompositions (this will be different every time you run the program), and end in an exception.
    - The test suite includes both square and rectangular matrices, but we restrict the difference between dimensions because very tall or wide matrices are unlikely to have LU decompositions.
4. To change the test code, open `main.py` in an editor and scroll down to the definition of `main()`. Here, you can change the values of the hardcoded matrix, add more hardcoded tests, or change the parameters of random matrix generation.

### Random Walk in Python
1. Run `cd random-walk`.
2. Refer to the instructions for your choice of installation in order to open `main.ipynb`.
3. Change any settings you wish in the cell at the top of the file. You can choose whether to display and/or store the output graphs, and how long to run the simulations.
4. In the top menu selection, find __Kernel__ and select __Restart & Run All__.
    - Note that the generation of the simulation images for the 2D random walk takes several minutes depending on the length of the simulation. This is normal.
5. If you choose to store the output graphs, they can be found in `[path-to-repo]/random-walk/output/`. You can view them in your IDE or any image viewer.
    - Extra information on how to interpret output graphs can be found in inline comments in the code.

<p align="center"><img width="700" src="/random-walk/output/brownian-motion/one-plot.png"></p>

### Instructions (TODO: remove)
Use examples liberally, and show the expected output if you can. It's helpful to have inline the smallest example of usage that you can demonstrate, while providing links to more sophisticated examples if they are too long to reasonably include in the README.

## Support
If you encounter trouble running our code, you can email the following:
- xiaoranc@umich.edu
- lesteven@umich.edu
- emshedde@umich.edu 

## Authors and acknowledgment
__Authors:__ Xiaoran Chen, Seok Jin Lee, & Emma Shedden

__Mentor:__ Hai Le

__Instructors:__ Ahmad Barhoumi, Sam Hansen

__Institution:__ University of Michigan

## Project status
In development.

### TODOs (Emma)
- [ ] rename files
- [x] get other stuff from Google Colab
- [x] fix formatting & comments
- [ ] all documentation
- [ ] reorganize directory tree according to what simulation methods they're used for
