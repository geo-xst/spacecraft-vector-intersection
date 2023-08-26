# Spacecraft-Vector Intersection (SVI)

This is a package that can take any spacecraft 3D model in .stl or .obj and:
1) calculate the field-of-view of an instrument
2) determine whether a vector intersects any part of the spacecraft
3) plot (visualise) the 3D model

The folders of the main branch are:
- /Models (containing the spacecrafts 3D models files)
- /MATLAB (containing the scripts for MATLAB)
- /Python (containing the scripts for Python)

There is the '/Models/Cassini' subfolder with the 3D Cassini model files as were published by the [NASA Visualization Technology Applications and Development (VTAD)](https://solarsystem.nasa.gov/resources/2401/cassini-3d-model/). The user can add additional models in new subfolders.

Currently it works only for MATLAB - we are working on translating it for Python.


MATLAB version:
-----------------
This code uses solely MATLAB function files (.m extension). The user needs to have MATLAB installed and add the SVI directory and subdirectories to the MATLAB path - no "special" installation needed. Example: let's say the SVI package was downloaded at 'C:\Users\Darth_Vader\MATLAB_packages' then you should include this folder to the MATLAB paths as follows: 

`addpath(genpath('C:\Users\Darth_Vader\MATLAB_packages\Spacecraft_Vector_Intersection\'))`

The `genpath` adds to the path the folder 'Spacecraft_Vector_Intersection' all its subfolders.


### Dependencies
The user needs to download and install the following packages, containing the required functions for the script:
1) for the stlread.m: "STL File Reader". Available at: https://www.mathworks.com/matlabcentral/fileexchange/22409-stl-file-reader
2) for the readOBJ.m: "gptoolbox: Geometry Processing Toolbox". Available at: https://github.com/alecjacobson/gptoolbox/


Python version:
-----------------
Coming soon


Acknowledgements:
------------------------
### MATLAB version:
- STL file reader:
Johnson, E. (2011) STL File Reader
Available at: https://www.mathworks.com/matlabcentral/fileexchange/22409-stl-file-reader (Accessed: 19 August 2023)
- OBJ file reader:
Jacobson et al. (2021) 
Part of the "gptoolbox: Geometry Processing Toolbox" 
Available at: https://github.com/alecjacobson/gptoolbox/ (Accessed: 19 August 2023)


Attribution
---------------------
If you use this work in an academic project, please cite it as follows: 

Xystouris G., Shebanits O., Arridge C.S. (2023) "Spacecraft-Vector Intersection (SVI)"

Or use this BibTeX entry:
@misc{svi,
  title = {Spacecraft-Vector Intersection (SVI)},
  author = {{Xystouris}, G., {Shebanits}, O., {Arridge}, C.S.},
  note = {https://github.com/geo-xst/Spacecraft_Vector_Intersection},
  year = {2023},
}

License
------------------------------
This work is licensed under the GNU General Public License v3.0.

Contact
--------------
You can contact me at george.xystouris@gmail.com
