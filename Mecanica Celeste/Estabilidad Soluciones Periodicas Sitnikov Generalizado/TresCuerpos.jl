#Problema tres cuerpos
using OrdinaryDiffEq, Plots

# Three Body
const threebody_μ = parse(BigFloat,"0.012277471"); const threebody_μ′ = 1 - threebody_μ

threebody = (t,u,du) -> begin
  # 1 = y₁
  # 2 = y₂
  # 3 = y₁'
  # 4 = y₂'
  D₁ = ((u[1]+threebody_μ)^2 + u[2]^2)^(3/2)
  D₂ = ((u[1]-threebody_μ′)^2 + u[2]^2)^(3/2)
  du[1] = u[3]
  du[2] = u[4]
  du[3] = u[1] + 2u[4] - threebody_μ′*(u[1]+threebody_μ)/D₁ - threebody_μ*(u[1]-threebody_μ′)/D₂
  du[4] = u[2] - 2u[3] - threebody_μ′*u[2]/D₁ - threebody_μ*u[2]/D₂
end
prob_ode_threebody = ODEProblem(threebody,[0.994, 0.0, 0.0, parse(BigFloat,"-2.00158510637908252240537862224")],(parse(BigFloat,"0.0"),parse(BigFloat,"17.0652165601579625588917206249")))
sol = solve(prob_ode_threebody,Vern7())
plot(sol,vars=(1,2))
