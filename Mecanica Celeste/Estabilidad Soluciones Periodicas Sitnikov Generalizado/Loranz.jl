g = @ode_def LorenzExample begin
  dx = σ*(y-x)
  dy = x*(ρ-z) - y
  dz = x*y - β*z
end σ=>10.0 ρ=>28.0 β=(8/3)
u0 = [1.0;0.0;0.0]
tspan = (0.0,50.0)
prob = ODEProblem(g,u0,tspan)
sol = solve(prob)
