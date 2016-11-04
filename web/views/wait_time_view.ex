defmodule Optiwait.WaitTimeView do
  use Optiwait.Web, :view

  def render("index.json", %{wait_times: wait_times}) do
    %{data: render_many(wait_times, Optiwait.WaitTimeView, "wait_time.json")}
  end

  def render("show.json", %{wait_time: wait_time}) do
    %{data: render_one(wait_time, Optiwait.WaitTimeView, "wait_time.json")}
  end

  def render("wait_time.json", %{wait_time: wait_time}) do
    %{id: wait_time.id,
      waiting_time: wait_time.waiting_time,
      clinic_id: wait_time.clinic_id}
  end
end
