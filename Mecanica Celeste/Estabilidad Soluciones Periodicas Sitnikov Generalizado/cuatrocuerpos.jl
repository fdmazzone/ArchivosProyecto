#Problema tres cuerpos
#using OrdinaryDiffEq, Plots, QuadGK

# Three Body

const μ = 0.5
const μ′ = 1 - μ
const q₁=0.5
const ν=1
const q₂=-0.5
M=[1 0 0 0;0 -1 0 0; 0 0 -1 0;0 0 0 1]
u1=eye(4)
Fuerza3c = (t,u,du) -> begin
  r₁ = (μ^2 +u[1]^2)^(3/2)
  r₂ = (μ′^2 +u[1]^2)^(3/2)
  du[1] = u[2]
  du[2] =μ/r₁*(-u[1])+(1-μ)/r₂*(-u[1])
end
#Altura máxima de la partícula

function CoefEst(z₀)
#function CoefEst(v₀)
#Periodo de la partícula
  #E=v₀^2/2-2
  E=-(z₀^2+1/4)^(-.5)
  #z₀=  v₀*sqrt(8-v₀^2 )/(4-v₀^2 )/2
  f(z)=1/sqrt(E+1/sqrt(1/4+z^2))
  T₀=quadgk(f,0,z₀-1e-10)
  T= T₀[1]/2^.5
  # Sistema no lineal


  u0 = [z₀,0.0]
  #u0 = [0,v₀]
  tspan = (0.0,T)

  prob_ode_trescuerpos = ODEProblem(Fuerza3c,u0,tspan)
  sol = solve(prob_ode_trescuerpos)
  #Matríz Variacional
  Φ(t)=1/4+(sol(t)[1])^2
  F₁(t)=(1+3/4/Φ(t)^(5/2)-1/Φ(t)^(3/2))
  F₂(t)=1-1/Φ(t)^(3/2)
  A(t)=[0 0 1 0;0 0 0 1; F₁(t) 0 0 2; 0 F₂(t) -2 0 ]

  #Sistema Ecuaciones Variacionales
  variacional(t,u)=A(t)*u


  prob_ode_variacional = ODEProblem(variacional,u1,tspan)
  so_var = solve(prob_ode_variacional)
  #Matríz monodromía

  G=(M*inv(so_var(T))*M*so_var(T))^2
  #Coeficientes de estabilidad
  p=-trace(G)
  q=.5*(p^2-trace(G^2))
  Δ=√(p^2-4(q-2))
  a₁=.5*(p+Δ)
  a₂=.5*(p-Δ)
  return (a₁,a₂,T)
end
#
v=linspace(5,	6,	600)
k=length(v)
a₁=Array{Float64}(k)
a₂ =Array{Float64}(k)
T =Array{Float64}(k)
for i=1:k
  a₁[i],a₂[i],T[i]=CoefEst(v[i])
end
