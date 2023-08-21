%
% DESCRIPTION
% Script for finding an instrument's field-of-view (FOV)
%
% INPUT:
%   - spacecraft model path: a character array with the path of the 
%        spacecraft model including the extension [.obj or .stl]
%        e.g. 'C:\Users\Darth_Vader\Documents\Cassini_3D_model_example\Cassini_NASA_model.obj'
%   - [x,y,z]: the instrument's location on the model     [model units / scale]
%
% OUTPUT:
%   - fov: the FOV contour of the spacecraft    [MATLAB polyshape]
%
%
%------------------------------------
% NOTES:
% - As it takes quite some time to find the contour for a model it is to
% calculate the contour once and save it. Then every time you want to use
% the contour load the saved one.
% - The units for the instruments x,y,z should be in the same units as the
% model. e.g. if the 1 unit of the model corresponds to 1 metre, the
% instrument's x,y,z "offset" from the s/c origin should also follow this.
%
% ------------------------------------
% Author: George Xystouris (23 March 2023)
% ------------------------------------
% Credits: George Xystouris
%          Oleg Shebanits
%          Chris Arridge
% (this work is submitted for publishing)
% ------------------------------------
% v1

function fov = instr_field_of_view(instr_x, instr_y, instr_z, model_path)

% -----------------
% CHECKS:
% -----------------

% Check that file is in a valid file name (.obj or .stl). If it's not, the script stops.
if ~strcmp(model_path(end-3:end),'.obj') && ~strcmp(model_path(end-3:end),'.stl')
    fprintf('Error in opening the model file. Fast checks:\n -File name (the extension .obj or .stl must be part of the file)\n -File location\n');
    return
end



% -----------------
% MAIN SCRIPT:
% -----------------

% Create the model (face, vertices, and normals)
if strcmp(model_path(end-3:end),'.obj')
    [sc_model.v, sc_model.f, ~, ~, sc_model.n,~] = readOBJ(model_path);
else strcmp(model_path(end-3:end),'.stl');
    [sc_model.f, sc_model.v, sc_model.n]  = stlread(model_path);
end

% Shift the model to have the instrument at the origin (0,0,0)
sc_shifted = sc_model;
sc_shifted.v = [sc_shifted.v(:,1)-instr_x  sc_shifted.v(:,2)-instr_y  sc_shifted.v(:,3)-instr_z];

% Convert from cartesian to spherical coordinates
[Vaz, Vel, ~] = cart2sph(sc_shifted.v(:,1), sc_shifted.v(:,2), sc_shifted.v(:,3));

% Assign the vertices for each face in the new coordinates
face = [];
for i_face = 1:length(sc_shifted.f)
    face = [face; polyshape( [Vaz(sc_shifted.f(i_face,1)), Vaz(sc_shifted.f(i_face,2)), Vaz(sc_shifted.f(i_face,3))] , ...
        [Vel(sc_shifted.f(i_face,1)), Vel(sc_shifted.f(i_face,2)), Vel(sc_shifted.f(i_face,3))] ) ];
end

% Find the contour of the multiple-polygons plot
sc_contour = union(face);
fov = sc_contour;

end





