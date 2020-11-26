require 'spec_helper'

RSpec.describe Tennis do
  subject(:tennis_match) { described_class.new }

  let(:player_one) { 'Joe' }
  let(:player_two) { 'Renata' }
  let(:player_one_score) { 0 }
  let(:player_two_score) { 0 }

  describe '#win_point' do
    subject { described_class.new(player_one, player_two) }

    context 'player one score points' do
      it 'it increments scores by one' do
        subject.win_point(player_one)
        expect(subject.display_score).to eq('15 : 0')

        subject.win_point(player_one)
        expect(subject.display_score).to eq('30 : 0')

        subject.win_point(player_one)
        expect(subject.display_score).to eq('40 : 0')
      end
    end

    context 'player two scores points' do
      it 'it increments scores by one' do
        subject.win_point(player_two)
        expect(subject.display_score).to eq('0 : 15')

        subject.win_point(player_two)
        expect(subject.display_score).to eq('0 : 30')

        subject.win_point(player_two)
        expect(subject.display_score).to eq('0 : 40')
      end
    end

    context 'both players score points' do
      it 'increments scores' do
        subject.win_point(player_one)
        subject.win_point(player_two)
        expect(subject.display_score).to eq('15 : 15')

        subject.win_point(player_one)
        subject.win_point(player_two)
        expect(subject.display_score).to eq('30 : 30')

        subject.win_point(player_one)
        subject.win_point(player_two)
        expect(subject.display_score).to eq('40 : 40')
      end
    end
  end


  describe '#score' do
    subject { described_class.new(player_one, player_two) }

    it 'outputs the player scores' do
      expect { subject.score }.to output('Player one score is..., player two score is...').to_stdout
    end

  end

end
