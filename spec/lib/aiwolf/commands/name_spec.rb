# frozen_string_literal: true

require 'rspec_helper'
require 'aiwolf/commands/name'

RSpec.describe Aiwolf::Commands::Name do
  let(:clazz) do
    Struct.new(nil) do
      include Aiwolf::Commands::Name

      def command_name(game_info)
        game_info
      end
    end
  end
  subject(:instance) { clazz.new }

  it { is_expected.to respond_to(:inner_command_name) }

  describe '#inner_command_name' do
    let(:expected_call_method) { :command_name }
    let(:packet) { { gameInfo: expected_call_args } }
    context 'called' do
      let(:expected_call_args) { { agentIdx: 1 } }
      it 'calls command_name and returns Name' do
        expect_any_instance_of(clazz)
          .to receive(expected_call_method).with(no_args).once
                                           .and_return('Name')
        expect(instance.inner_command_name(packet))
          .to eql 'Name'
      end
    end
    context 'called' do
      let(:expected_call_args) { {} }
      it 'calls command_name and returns the class name as default' do
        expect_any_instance_of(clazz)
          .to receive(expected_call_method).with(no_args).once
                                           .and_return(nil)
        expect(instance.inner_command_name(packet))
          .to eql clazz.to_s
      end
    end
  end
end
