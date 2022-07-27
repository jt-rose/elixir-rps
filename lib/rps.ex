defmodule RPS do
  @moduledoc """
  Documentation for `RPS`.
  """

  defp get_player_choice do
    :rock
  end

  defp get_ai_choice do
    random_number = :rand.uniform(3)
    case random_number do
      1 -> :rock
      2 -> :paper
      3 -> :scissors
    end
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
    IO.puts "You played #{player} and the opponent played #{ai}"

    result = get_game_result(player, ai)
    case result do
      :win -> IO.puts "You win!"
      :loss -> IO.puts "Oh no! You lost!"
      :tie -> IO.puts "A tie!"
    end
  end
end

RPS.play()
