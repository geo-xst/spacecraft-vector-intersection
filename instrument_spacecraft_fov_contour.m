%
% DESCRIPTION: this script finds the spacecraft contour of an instrument's 
% FOV.
%  
% INPUT:
%       model_path: char string with the path of the model. Format of the
%                   model is .obj
%       instr_x/y/z: x/y/z coordinates of the instrument based on the
%                   model.    [double]
%
% OUTPUT:
%       sc_contour: polyshape in spherical coordinates. 
%                   SHAPE LIMITS: azimuth: [-pi pi]; elevation: [-pi/2 pi/2]
%
%------------------------------------
% NOTES:
% The NASA Cassini model to be used is from: https://solarsystem.nasa.gov/resources/2401/cassini-3d-model/
%
%------------------------------------
% Author: George Xystouris (28 March 2023)
%


function [sc_contour] = instrument_spacecraft_fov_contour(model_path, instr_x, instr_y, instr_z)

% Create the model
sc_model = cassini_model(model_path);

% Shift the model to have the instrument at the origin (0,0,0)
sc_shifted = sc_model; % copy the initial model as a new model to be modify later
sc_shifted.v = [sc_shifted.v(:,1)-instr_x  sc_shifted.v(:,2)-instr_y  sc_shifted.v(:,3)-instr_z];
    % fig_white; patch('Faces',cassini_shifted.f,'Vertices',cassini_shifted.v,'FaceColor',[0.95 0.69 0.06],'EdgeColor','black');
    % xlabel('X'); ylabel('Y'); zlabel('Z'); axis equal;
    % close all

% Convert from cartesian to spherical coordinates
[Vaz, Vel, Vr] = cart2sph(sc_shifted.v(:,1), sc_shifted.v(:,2), sc_shifted.v(:,3));

% Assign the vertices for each face in the new coordinates
face = [];
for i_face = 1:length(sc_shifted.f)
    face = [face; polyshape( [Vaz(sc_shifted.f(i_face,1)), Vaz(sc_shifted.f(i_face,2)), Vaz(sc_shifted.f(i_face,3))] , ...
        [Vel(sc_shifted.f(i_face,1)), Vel(sc_shifted.f(i_face,2)), Vel(sc_shifted.f(i_face,3))] ) ];
end

% Find the contour of the multiple-polygons plot
sc_contour = union(face);

    % fig_white; plot(cassini_nasa_lp_contour);

end













