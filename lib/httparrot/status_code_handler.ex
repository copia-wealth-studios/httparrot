defmodule HTTParrot.StatusCodeHandler do
  @moduledoc """
  Returns given HTTP Status code.
  """
  use HTTParrot.Cowboy, methods: ~w(GET HEAD OPTIONS)

  def content_types_provided(req, state) do
    {[{{"application", "json", []}, :get_json}], req, state}
  end

  def get_json(req, state) do
    code = :cowboy_req.binding(:code, req)
    req = :cowboy_req.reply(code, %{}, "", req)
    {:stop, req, state}
  end
end
