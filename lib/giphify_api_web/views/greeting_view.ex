defmodule GiphifyApiWeb.GreetingView do
  use GiphifyApiWeb, :view
  alias GiphifyApiWeb.GreetingView

  def render("index.json", %{greetings: greetings}) do
    %{data: render_many(greetings, GreetingView, "greeting.json")}
  end

  def render("show.json", %{greeting: greeting}) do
    %{data: render_one(greeting, GreetingView, "greeting.json")}
  end

  def render("greeting.json", %{greeting: greeting}) do
    %{id: greeting.id,
      phrase: greeting.phrase}
  end
end
