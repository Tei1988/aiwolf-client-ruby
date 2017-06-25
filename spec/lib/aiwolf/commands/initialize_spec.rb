# frozen_string_literal: true

require 'rspec_helper'
require 'aiwolf/commands/initialize'

RSpec.describe Aiwolf::Commands::Initialize do
  let(:clazz) do
    Struct.new(nil) do
      include Aiwolf::Commands::Initialize

      def command_initialize(game_info)
        game_info
      end
    end
  end
  subject(:instance) { clazz.new }

  it { is_expected.to respond_to(:inner_command_initialize) }

  describe '#inner_command_initialize' do
    let(:expected_call_method) { :command_initialize }
    let(:packet) do
      {
        gameInfo: expected_call_args_game_info,
        gameSetting: expected_call_args_game_setting,
      }
    end
    context 'called' do
      let(:expected_call_args_game_info) { { agentIdx: 1 } }
      let(:expected_call_args_game_setting) { {} }
      it 'calls command_initialize with Hash and returns nil' do
        expect_any_instance_of(clazz)
          .to receive(expected_call_method)
          .with(expected_call_args_game_info, expected_call_args_game_setting)
          .once
          .and_return(expected_call_args_game_info)
        expect(instance.inner_command_initialize(packet))
          .to be_nil
      end
    end
    context 'called' do
      let(:expected_call_args_game_info) { {} }
      let(:expected_call_args_game_setting) { {} }
      it 'calls command_initialize with empty Hash and returns nil' do
        expect_any_instance_of(clazz)
          .to receive(expected_call_method)
          .with(expected_call_args_game_info, expected_call_args_game_setting)
          .once
          .and_return(expected_call_args_game_info)
        expect(instance.inner_command_initialize(packet))
          .to be_nil
      end
    end
    context 'called' do
      let(:expected_call_args_game_info) { nil }
      let(:expected_call_args_game_setting) { {} }
      it 'calls command_initialize with nil and returns nil' do
        expect_any_instance_of(clazz)
          .to receive(expected_call_method)
          .with(expected_call_args_game_info, expected_call_args_game_setting)
          .once
          .and_return(expected_call_args_game_info)
        expect(instance.inner_command_initialize(packet))
          .to be_nil
      end
    end
  end
end
