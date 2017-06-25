# frozen_string_literal: true

require 'rspec_helper'
require 'aiwolf/commands/vote'

RSpec.describe Aiwolf::Commands::Vote do
  let(:clazz) do
    Struct.new(nil) do
      include Aiwolf::Commands::Vote

      def command_vote(game_info)
        game_info
      end
    end
  end
  subject(:instance) { clazz.new }

  it { is_expected.to respond_to(:inner_command_vote) }

  describe '#inner_command_vote' do
    context 'called' do
      let(:packet) { { gameInfo: { agentIdx: 1 } } }
      it 'calls command_vote with Hash and return JSON' do
        expect(instance.inner_command_vote(packet))
          .to eql JSON.generate({ agentIdx: 1 })
      end
    end
    context 'called' do
      let(:packet) { { gameInfo: {} } }
      it 'calls command_vote with empty Hash and return blank' do
        expect(instance.inner_command_vote(packet))
          .to eql ''
      end
    end
    context 'called' do
      let(:packet) { { gameInfo: nil } }
      it 'calls command_vote with nil and return blank' do
        expect(instance.inner_command_vote(packet))
          .to eql ''
      end
    end
  end
end
