defmodule Optiwait.HourView do
  use Optiwait.Web, :view

  def render("index.json", %{hours: hours}) do
    %{data: render_many(hours, Optiwait.HourView, "hour.json")}
  end

  def render("show.json", %{hour: hour}) do
    %{data: render_one(hour, Optiwait.HourView, "hour.json")}
  end

  def render("hour.json", %{hour: hour}) do
    %{id: hour.id,
      weekday: hour.weekday,
      start_hour: hour.start_hour,
      end_hour: hour.end_hour,
      closed: hour.closed,
      clinic_id: hour.clinic_id}
  end
end
