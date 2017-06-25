# frozen_string_literal: true

require 'rspec_helper'
require 'aiwolf/commands/divine'

RSpec.describe Aiwolf::Commands::Divine do
  let(:clazz) do
    Struct.new(nil) do
      include Aiwolf::Commands::Divine
    end
  end
  subject(:instance) { clazz.new }

  it { is_expected.to respond_to(:inner_command_divine) }

  describe '#inner_command_divine' do
    let(:expected_call_method) { :command_divine }
    let(:packet) { { gameInfo: expected_call_args } }
    context 'called' do
      let(:expected_call_args) { { agentIdx: 1 } }
      it 'calls command_divine with Hash and returns JSON' do
        expect_any_instance_of(clazz)
          .to receive(expected_call_method).with(expected_call_args).once
                                           .and_return(expected_call_args)
        expect(instance.inner_command_divine(packet))
          .to eql JSON.generate(expected_call_args)
      end
    end
    context 'called' do
      let(:expected_call_args) { {} }
      it 'calls command_divine with empty Hash and returns blank' do
        expect_any_instance_of(clazz)
          .to receive(expected_call_method).with(expected_call_args).once
                                           .and_return(expected_call_args)
        expect(instance.inner_command_divine(packet))
          .to be_blank
      end
    end
    context 'called' do
      let(:expected_call_args) { nil }
      it 'calls command_divine with nil and returns blank' do
        expect_any_instance_of(clazz)
          .to receive(expected_call_method).with(expected_call_args).once
                                           .and_return(expected_call_args)
        expect(instance.inner_command_divine(packet))
          .to be_blank
      end
    end
  end
end
