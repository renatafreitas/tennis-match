require 'tty-prompt'

class Tennis
  # $prompt = TTY::Prompt.new
  # name = $prompt.ask('hello, whats your name')
  # puts name
  #
  attr_accessor :player_one_score, :player_two_score

  def initialize(player_one, player_two)
    raise ArgumentError, 'Please give player names' if player_one.nil? || player_two.nil?
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


end
