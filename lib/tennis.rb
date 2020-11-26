# frozen_string_literal: true
require 'pry'

class Tennis

  attr_accessor :player_one_score, :player_two_score

  SCORES = ['0', '15', '30', '40']

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @player_one_score = 0
    @player_two_score = 0
  end

  def win_point(player_name)
    if player_name == @player_one
      @player_one_score += 1
    else
      @player_two_score += 1
    end
  end

  def display_score
    "#{SCORES[@player_one_score]} : #{SCORES[@player_two_score]}"

    # return "Game won by #{winner}" if game_finished?

  end

  def winner
    @player_one_score >= 4 && @player_two_score + 2 != @player_one_score
  end

  def game_finished?; end
end
