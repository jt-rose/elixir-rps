defmodule RPS do
  @moduledoc """
  Documentation for `RPS`.
  """

  defp get_player_choice do
    :rock
  end

  defp get_ai_choice do
    :scissors
  end

  defp get_game_result(player, ai) do
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

  def play do
    player = get_player_choice()
    ai = get_ai_choice()
    result = get_game_result(player, ai)
    IO.puts(result)
  end
end

RPS.play()
