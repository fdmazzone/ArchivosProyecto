#Problema tres cuerpos
#using DifferentialEquations

#Función Fuerza
Fuerza3c = @ode_def TresCuespos begin
  dx = ξ
  dy = η
  dz = ζ
  dξ =  2*ν*η + ν^2*x+mu/sqrt((q₁-x)^2+y^2+z^2)^3*(q₁-x)+(1-mu)/sqrt((q₂-x)^2+y^2+z^2)^3*(q₂-x)
  dη = -2*ν*ξ - ν^2*y+mu/sqrt((q₁-x)^2+y^2+z^2)^3*(-y)+(1-mu)/sqrt((q₂-x)^2+y^2+z^2)^3*(-y)
  dζ =               +mu/sqrt((q₁-x)^2+y^2+z^2)^3*(-z)+(1-mu)/sqrt((q₂-x)^2+y^2+z^2)^3*(-z)
end μ=>0.5 q₁=>0.5 ν=>1 r₁=> q₂=>-0.5 

u0 = [0.0;0.0;0.0;0.0;0.0;1]
tspan = (0.0,10.0)

prob_ode_threebody = ODEProblem(Fuerza3c,u0,tspan)
sol = solve(prob_ode_threebody,Vern7())
#plot(sol,vars=(1,2,3))
