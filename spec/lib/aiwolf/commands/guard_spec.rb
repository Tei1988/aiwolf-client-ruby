# frozen_string_literal: true

require 'rspec_helper'
require 'aiwolf/commands/guard'

RSpec.describe Aiwolf::Commands::Guard do
  let(:clazz) do
    Struct.new(nil) do
      include Aiwolf::Commands::Guard

      def command_guard(game_info)
        game_info
      end
    end
  end
  subject(:instance) { clazz.new }

  it { is_expected.to respond_to(:inner_command_guard) }

  describe '#inner_command_guard' do
    context 'called' do
      let(:packet) { { gameInfo: { agentIdx: 1 } } }
      it 'calls command_guard with Hash and return JSON' do
        expect(instance.inner_command_guard(packet))
          .to eql JSON.generate({ agentIdx: 1 })
      end
    end
    context 'called' do
      let(:packet) { { gameInfo: {} } }
      it 'calls command_guard with empty Hash and return blank' do
        expect(instance.inner_command_guard(packet))
          .to eql ''
      end
    end
    context 'called' do
      let(:packet) { { gameInfo: nil } }
      it 'calls command_guard with nil and return blank' do
        expect(instance.inner_command_guard(packet))
          .to eql ''
      end
    end
  end
end
