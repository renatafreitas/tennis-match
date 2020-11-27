require 'spec_helper'

RSpec.describe Tennis do
  subject(:tennis_match) { described_class.new }

  let(:player_one) { 'Joe' }
  let(:player_two) { 'Renata' }

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
      end
    end

    context 'deuce' do
      context 'when both players are on 40 points' do
        it 'calls deuce' do
          3.times { subject.win_point(player_one) }
          3.times { subject.win_point(player_two) }
          expect(subject.display_score).to eq('Deuce')
        end
      end

      context 'when one player has advantage' do
        it 'declares their advantage' do
          3.times { subject.win_point(player_one) }
          4.times { subject.win_point(player_two) }
          expect(subject.display_score).to eq('40 : advantage')
        end
      end

      context 'when other player has advantage' do
        it 'declares their advantage' do
          4.times { subject.win_point(player_one) }
          3.times { subject.win_point(player_two) }
          expect(subject.display_score).to eq('advantage : 40')
        end
      end
    end

    context 'one player wins by two points' do
      it 'declares player one the winner' do
        4.times { subject.win_point(player_one) }
        expect(subject.display_score).to eq('Game won by Joe')

      end

      it 'declares player two the winner' do
        4.times { subject.win_point(player_two) }
        expect(subject.display_score).to eq('Game won by Renata')
      end
    end
  end


end
