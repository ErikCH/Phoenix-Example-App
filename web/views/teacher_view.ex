defmodule App2.TeacherView do
  use App2.Web, :view
  use JaSerializer.PhoenixView

  attributes [:name, :age, :inserted_at, :updated_at]
  

end
