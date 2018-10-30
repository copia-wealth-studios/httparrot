defmodule HTTParrot.DeleteHandler do
  @moduledoc """
  Returns DELETE data.
  """
  alias HTTParrot.GeneralRequestInfo
  use HTTParrot.Cowboy, methods: ~w(DELETE)

  def content_types_provided(req, state) do
    {[{{"application", "json", []}, :get_json}], req, state}
  end

  def delete_resource(req, state) do
    {info, req} = GeneralRequestInfo.retrieve(req)
    req = :cowboy_req.set_resp_body(response(info), req)
    {true, req, state}
  end

  defp response(info) do
    info |> JSX.encode!
  end
end
