defmodule Optiwait.ClinicView do
  use Optiwait.Web, :view

  def render("index.json", %{clinics: clinics}) do
    %{data: render_many(clinics, Optiwait.ClinicView, "clinic.json")}
  end

  def render("show.json", %{clinic: clinic}) do
    %{data: render_one(clinic, Optiwait.ClinicView, "clinic.json")}
  end

  def render("clinic.json", %{clinic: clinic}) do
    %{id: clinic.id,
      name: clinic.name,
      about: clinic.about,
      user_id: clinic.user_id,
      location: render_one(clinic.location, Optiwait.LocationView, "location.json"),
      hours: render_many(clinic.hours, Optiwait.HourView, "hour.json")}
  end
end
