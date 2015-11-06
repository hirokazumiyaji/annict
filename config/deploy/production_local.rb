server "annict-db-local", user: "annict", roles: %w(db)
server "annict-app-local", user: "annict", roles: %w(app)

set :branch, :production_local
