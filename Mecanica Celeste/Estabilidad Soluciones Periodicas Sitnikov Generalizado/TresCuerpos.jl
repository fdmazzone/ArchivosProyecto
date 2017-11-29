#Problema tres cuerpos
#using OrdinaryDiffEq, Plots

# Three Body
const μ = parse(BigFloat,"0.5"); 
const μ′ = 1 - μ
const q₁=0.5
const ν=1
const q₂=-0.5

Fuerza3c = (t,u,du) -> begin
  # 1 = y₁
  # 2 = y₂
  # 3 = y₃
  # 3 = y₁'
  # 4 = y₂'
  # 5 = y₃'
  r₁ = ((u[1]+μ)^2 + u[2]^2+u[3]^2)^(3/2)
  r₂ = ((u[1]-μ′)^2 + u[2]^2+u[3]^2)^(3/2)
  du[1] = u[4]
  du[2] = u[5]
  du[3] = u[6]
  du[4] = 2*ν*u[5] + ν^2*u[1]+μ/r₁*(q₁-u[1])+(1-μ)/r₂*(q₂-u[1])
  du[5] = -2*ν*u[4] - ν^2*u[2]+μ/r₁*(-u[2])+(1-μ)/r₂^3*(-u[2])
  du[6] =           +μ/r₁*(-u[3])+(1-μ)/r₂*(-u[3])
end
u0 = [0.28939335;0.0;0.0;0.0;-2.50887548;0]
tspan = (0.0,1.0)
prob_ode_trescuerpos = ODEProblem(Fuerza3c,u0,tspan)
sol = solve(prob_ode_trescuerpos,Tsit5(),reltol=1e-12,abstol=1e-12)
#gui()
#plotly()
#plot(sol,vars=(1,2,3))
