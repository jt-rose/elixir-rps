defmodule RPS do
  @moduledoc """
  Documentation for `RPS`.
  """

  defp get_player_choice do
    choice = IO.gets "r) rock, p) paper, or s) scissors ?"
    case String.trim(choice) do
      "r" -> :rock
      "p" -> :paper
      "s" -> :scissors
      _ -> get_player_choice()
    end
  end

  defp get_ai_choice do
    random_number = :rand.uniform(3)
    case random_number do
      1 -> :rock
      2 -> :paper
      3 -> :scissors
    end
  end

  defp get_round_result(player, ai) do
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

  defp play_round do
    player = get_player_choice()
    ai = get_ai_choice()
    IO.puts "You played #{player} and the opponent played #{ai}"

    result = get_round_result(player, ai)
    result
  end

  defp convert_result_to_int(result) do
    case result do
      :win -> 1
      :loss -> -1
      :tie -> 0
    end
  end

  def play_3_rounds do
    round_1 = play_round()
    round_2 = play_round()
    round_3 = play_round()

    rounds = [round_1, round_2, round_3]
    result = rounds |> Enum.map(&convert_result_to_int/1) |> Enum.sum()

    case result do
      x when x > 0 -> IO.puts "You win!"
      x when x < 0 -> IO.puts "Oh no! You lost!"
      _ -> IO.puts "A tie!"
    end
  end
end

RPS.play_3_rounds()
