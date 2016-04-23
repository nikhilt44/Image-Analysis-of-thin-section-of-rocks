
function[p1] = permea(ssa,p,t)

% Permeability Calcualation using porosity and specific surface area
% Kozney Carman Equation

%p1 = p^3/(((1-p)^2)*ssa*ssa*5);
%------------------------------------------
%------------------------------------------

m=1.9;
c=3;
% Form Factor
F = p^(-m);

p1 = (p^2)/(c*F*ssa*ssa);