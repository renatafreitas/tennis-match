# frozen_string_literal: true
require 'pry'

class Tennis

  attr_accessor :player_one, :player_two, :score

  SCORES = ['0', '15', '30', '40']

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @score = {
        player_one => 0,
        player_two => 0
    }
  end

  def win_point(player_name)
    score[player_name] += 1
  end

  def display_score
    return "Game won by #{winner[0]}" if game_finished?

    "#{SCORES[score[player_one]]} : #{SCORES[score[player_two]]}"
  end

  def winner
    score.max_by { |_,v| v}
  end

  def game_finished?
    score.max
  end
end
