defmodule App2.Router do
  use App2.Web, :router

  pipeline :api do
    plug :accepts, ["json-api"]
  end

  scope "/api", App2 do
    pipe_through :api
    resources "/teachers", TeacherController, except: [:new, :edit]
  end
end
