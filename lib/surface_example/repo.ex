defmodule SurfaceExample.Repo do
  use Ecto.Repo,
    otp_app: :surface_example,
    adapter: Ecto.Adapters.Postgres
end
