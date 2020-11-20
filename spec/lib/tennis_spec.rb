require 'spec_helper'

RSpec.describe Tennis do
  subject { described_class }

  let(:player_one) { 'Joe' }
  let(:player_two) { 'Renata' }
  let(:player_one_score) { 0 }
  let(:player_two_score) { 0 }

  describe '#initialize' do
    context 'when two arguments are not given' do
      it 'raises an argument error' do
        expect { subject.new(nil, nil) }.to raise_error(ArgumentError, 'Please give player names')
      end
    end

    context 'when two arguments are given' do
      it 'does not raise an error' do
        expect { subject.new(player_one, player_two) }.not_to raise_error
      end
    end
  end

  describe '#win_point' do
    subject { described_class.new(player_one, player_two) }

    context 'when a player wins a point' do
      it 'it increments their score by one' do
        subject.win_point(player_one)
        expect(subject.player_one_score).to eq(1)
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
