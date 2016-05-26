defmodule App2.TeacherController do
  use App2.Web, :controller

  alias App2.Teacher
  alias JaSerializer.Params

  plug :scrub_params, "data" when action in [:create, :update]

  def index(conn, _params) do
    teacher = Repo.all(Teacher)
    render(conn, "index.json", data: teacher)
  end

  def create(conn, %{"data" => data = %{"type" => "teacher", "attributes" => _teacher_params}}) do
    changeset = Teacher.changeset(%Teacher{}, Params.to_attributes(data))

    case Repo.insert(changeset) do
      {:ok, teacher} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", teacher_path(conn, :show, teacher))
        |> render("show.json", data: teacher)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(App2.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    teacher = Repo.get!(Teacher, id)
    render(conn, "show.json", data: teacher)
  end

  def update(conn, %{"id" => id, "data" => data = %{"type" => "teacher", "attributes" => _teacher_params}}) do
    teacher = Repo.get!(Teacher, id)
    changeset = Teacher.changeset(teacher, Params.to_attributes(data))

    case Repo.update(changeset) do
      {:ok, teacher} ->
        render(conn, "show.json", data: teacher)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(App2.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    teacher = Repo.get!(Teacher, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(teacher)

    send_resp(conn, :no_content, "")
  end

end
