# Standard Brownian motion

## Description
Brownian motion [[1](http://galton.uchicago.edu/~lalley/Courses/313/WienerProcess.pdf), [2](https://en.wikipedia.org/wiki/Brownian_motion)] is a mathematical model for a common physical process which occurs in both the natural world and man-made systems. Common examples include the diffusion of small particles in a liquid or gas (as studied by [Albert Einstein](https://www.aps.org/publications/apsnews/200502/history.cfm)) and the movement of certain economic indices (as studied by [Louis Bachelier](https://en.wikipedia.org/wiki/Louis_Bachelier)). Thus, the simulation of Brownian motions is useful to support understanding of the mathematical process and contribute to its wide-ranging applications.

This repository contains:
- Implementations of the Random Walk (Python, MATLAB) and Series Representation (MATLAB) simulation methods for standard Brownian motions.
- Implementations of useful algorithms which our simulations rely on for efficiency over naive approaches.
    - Tests of these implementations against standard library implementations in Scikit and Numpy.
    - These are for learning purposes; the standard library functions are used in our simulation code.

## Installation

### Python Requirements
- Language version: Any version of Python 3 should work fine.
- Packages: `numpy`, `matplotlib`, `scipy`
- Visualization: Graphics are not supported by default on WSL; this may be an issue on other setups as well. To be able to generate graphs and other visualizations, it may be necessary to set up X-11 forwarding. Consider XLaunch from SourceForge via [VcXsrv](https://sourceforge.net/projects/vcxsrv/) or [Xming](https://sourceforge.net/projects/xming/).

### Python installation
1. Follow [this guide](https://wiki.python.org/moin/BeginnersGuide/Download) to install Python 3.
2. In your command line, run `pip install numpy matplotlib scipy`. If your `pip` still points to Python 2 (you can check by running `pip -V`), then use `pip3 install` instead.
3. If you use WSL/WSL2 on Windows and do not have X-11 forwarding previously set up, follow [this guide](https://stackoverflow.com/questions/61110603/how-to-set-up-working-x11-forwarding-on-wsl2).
    - Any commands that attempt to display graphics will hang if this is not set up, so if you don't care about generating your own graphs and don't want to bother with X-11 forwarding, make sure to comment out any instances of `plt.show()` or `plt.save()` in the Python code.

### Jupyter Notebook Requirements
- For `.ipynb` files

#### Option 1: Google Colab
1. Upload `.ipynb` files to Google Colab.
2. Uncomment all "for Google Colab" lines in the code (mainly Colab-specific imports).
3. Code is ready to edit/run. Note that output files are saved into the Colab filesystem.

#### Option 2: Jupyter Lab
1. Follow [this guide](https://jupyter.org/install) to install Jupyter Lab.
2. Code is ready to edit/run in the Jupyter Lab IDE. You may need to copy the files into Jupyter Lab.

#### Option 3: Jupyter (in your regular IDE)
1. Install Jupyter by following [this guide](https://jupyter.org/install).
2. If you use WSL/WSL2 on Windows, you likely need to install [VSCode Insiders](https://code.visualstudio.com/insiders/), since standard VSCode doesn't support Jupyter notebooks out of the box. 
    a) Open VSCode using `code-insiders [path-to-directory]`. Follow the prompts to choose a kernel and install necessary packages. See this [resource](https://stackoverflow.com/questions/60025150/jupyter-notebooks-in-vs-code-using-wsl-2-are-not-working) for more info.
    b) If the prompt to install `ipykernel` loops, go to the command line (in the environment you are using as your kernel) and make sure both `ipython` and `ipykernel` are installed.
3. 

### MATLAB Requirements (TODO)

Within a particular ecosystem, there may be a common way of installing things, such as using Yarn, NuGet, or Homebrew. However, consider the possibility that whoever is reading your README is a novice and would like more guidance. Listing specific steps helps remove ambiguity and gets people to using your project as quickly as possible. If it only runs in a specific context like a particular programming language version or operating system or has dependencies that have to be installed manually, also add a Requirements subsection.

## Usage (TODO)
Use examples liberally, and show the expected output if you can. It's helpful to have inline the smallest example of usage that you can demonstrate, while providing links to more sophisticated examples if they are too long to reasonably include in the README.

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
- [ ] fix formatting & comments
- [ ] all documentation
- [ ] reorganize directory tree according to what simulation methods they're used for
