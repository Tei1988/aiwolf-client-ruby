# frozen_string_literal: true

require 'rspec_helper'
require 'aiwolf/commands/attack'

RSpec.describe Aiwolf::Commands::Attack do
  let(:clazz) do
    Struct.new(nil) do
      include Aiwolf::Commands::Attack

      def command_attack(game_info)
        game_info
      end
    end
  end
  subject(:instance) { clazz.new }

  it { is_expected.to respond_to(:inner_command_attack) }

  describe '#inner_command_attack' do
    context 'called' do
      let(:packet) { { gameInfo: { agentIdx: 1 } } }
      it 'calls command_attack with Hash and return JSON' do
        expect(instance.inner_command_attack(packet))
          .to eql JSON.generate({ agentIdx: 1 })
      end
    end
    context 'called' do
      let(:packet) { { gameInfo: {} } }
      it 'calls command_attack with empty Hash and return blank' do
        expect(instance.inner_command_attack(packet))
          .to eql ''
      end
    end
    context 'called' do
      let(:packet) { { gameInfo: nil } }
      it 'calls command_attack with nil and return blank' do
        expect(instance.inner_command_attack(packet))
          .to eql ''
      end
    end
  end
end
