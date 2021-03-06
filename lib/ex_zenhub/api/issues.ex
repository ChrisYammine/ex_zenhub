defmodule ExZenHub.Issues do
  import ExZenHub.API.Base

  def get(repo_id, issue_number, opts \\ []) do
    request(:get, "repositories/#{repo_id}/issues/#{issue_number}", [], opts)
    |> ExZenHub.Parser.parse(:issue, [issue_number: issue_number])
    |> decorate_response
  end

  def events(repo_id, issue_number, opts \\ []) do
    request(:get, "repositories/#{repo_id}/issues/#{issue_number}/events", [], opts)
    |> ExZenHub.Parser.parse(:events)
    |> decorate_response
  end
end
