defmodule Optiwait.LocationView do
  use Optiwait.Web, :view

  def render("index.json", %{locations: locations}) do
    %{data: render_many(locations, Optiwait.LocationView, "location.json")}
  end

  def render("show.json", %{location: location}) do
    %{data: render_one(location, Optiwait.LocationView, "location.json")}
  end

  def render("location.json", %{location: location}) do
    %{id: location.id,
      place_id: location.place_id,
      address: location.address,
      city: location.city,
      province: location.province,
      country: location.country,
      clinic_id: location.clinic_id}
  end
end
