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
    return "Game won by #{winner}" if game_finished?

    if score.values.max == 3 && score.values.min == 3
      return 'Deuce'
    else
      "#{SCORES[score[player_one]]} : #{SCORES[score[player_two]]}"
    end

    "#{SCORES[score[player_one]]} : #{SCORES[score[player_two]]}"
  end

  def winner
    score.max_by { |_,v| v}.first
  end

  def deuce?
    return 'Deuce' if score.values.max == 3 && score.values.min == 3

    if score.values.max == 4 && score.values.min == 3
      "#{SCORES[score.values.min]} : advantage" if score[player_two] == 4
    else
      "advantage : #{SCORES[score.values.min]}" if score[player_one] == 4
    end
  end

  def game_finished?
    score.values.max >= 4 && score.values.max - score.values.min >= 2
  end

end
