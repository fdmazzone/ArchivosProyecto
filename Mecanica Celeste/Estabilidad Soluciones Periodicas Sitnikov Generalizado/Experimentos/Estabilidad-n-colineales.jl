#Problema tres cuerpos
#using OrdinaryDiffEq, Plots, QuadGK

# CC colineales general


function Estabilidad(m,s,v) #CARGAR SOLO LAS POSICIONES POSITIVAS

# proveemos m=vetor de masas, s=vector de posiciones
#CARGAR SOLO LAS POSICIONES POSITIVAS
#v=linspace(10.3,	15.13,	1000), vector de posiciones iniciaeles

k=length(v)
a₁=Array{Complex{Float64}}(k)
a₂ =Array{Complex{Float64}}(k)
T =Array{Float64}(k)
Δ =Array{Complex{Float64}}(k)
for i=1:k
  a₁[i],a₂[i],T[i],Δ[i]=CoefEst(v[i])
end
print("todo biene")
    return (a₁, a₂, Δ, T)
end

#Asi se programa las funciones para el solver F(du, variable independet , param, var. indepent.)
function Fuerza3c(du,u,p,t)
  r = (s.^2 +u[1]^2).^(1.5)
  du[1] = u[2]
  du[2] = sum(m./r)*(-2*u[1])
  end

#Altura máxima de la partícula

function CoefEst(z₀)
    M=[1 0 0 0;0 -1 0 0; 0 0 -1 0;0 0 0 1]
    u1=eye(4)
#function CoefEst(v₀)
#Periodo de la partícula
  #E=v₀^2/2-2
#REVISAR
 r = (s.^2 +z₀^2).^(.5)

  E=-2*sum(m./r)
  #z₀=  v₀*sqrt(8-v₀^2 )/(4-v₀^2 )/2
f(z)=1/sqrt(E+2sum(m./sqrt.(s.^2+z^2)))

  #f(z)=1/sqrt(E+2m₁/sqrt(s₁^2+z^2)+2m₂/sqrt(s₂^2+z^2)) #-------
  T₀=quadgk(f,0,z₀-1e-10)
  T= T₀[1]/2^.5
  # Sistema no lineal


  u0 = [z₀,0.0]
  #u0 = [0,v₀]
  tspan = (0.0,T)

  prob_ode_trescuerpos = ODEProblem(Fuerza3c,u0,tspan)
  sol = solve(prob_ode_trescuerpos,TsitPap8())
  #Matríz Variacional

  Φ(t)=s.^2+(sol(t)[1])^2

# REVISAR


F₂(t)=1-2*sum(m.*(Φ(t).^(-1.5)))
F₁(t)=F₂(t)+6*sum(m.*(s.^2.*Φ(t).^(-2.5)))



  A(t)=[0 0 1 0;0 0 0 1; F₁(t) 0 0 2; 0 F₂(t) -2 0 ]

#-------
  #Sistema Ecuaciones Variacionales
  variacional(u,p,t)=A(t)*u


  prob_ode_variacional = ODEProblem(variacional,u1,tspan)
  so_var = solve(prob_ode_variacional)
  #Matríz monodromía


  G=(M*inv(so_var(T))*M*so_var(T))^2
  #Coeficientes de estabilidad
  p=-trace(G)
  q=.5*(p^2-trace(G^2))

  Δ=sqrtm(p^2-4(q-2))

  a₁=.5*(p+Δ)
  a₂=.5*(p-Δ)
  return (a₁,a₂,T,Δ)
end
#
