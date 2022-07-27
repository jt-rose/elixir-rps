defmodule RPS do
  @moduledoc """
  Documentation for `RPS`.
  """

  def get_game_result(player, ai) do
    case {player, ai} do
      {player, player} -> :tie
      {:rock, :paper} -> :loss
      {:rock, :scissors} -> :win
      {:paper, :rock} -> :win
      {:paper, :scissors} -> :loss
      {:scissors, :rock} -> :rock
      {:scissors, :paper} -> :win
    end
  end
end

IO.puts RPS.get_game_result(:rock, :scissors)
