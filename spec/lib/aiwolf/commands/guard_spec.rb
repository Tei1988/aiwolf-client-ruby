# frozen_string_literal: true

require 'rspec_helper'
require 'aiwolf/commands/guard'

RSpec.describe Aiwolf::Commands::Guard do
  let(:clazz) do
    Struct.new(nil) do
      include Aiwolf::Commands::Guard
    end
  end
  subject(:instance) { clazz.new }

  it { is_expected.to respond_to(:inner_command_guard) }

  describe '#inner_command_guard' do
    let(:expected_call_method) { :command_guard }
    let(:packet) { { gameInfo: expected_call_args } }
    context 'called' do
      let(:expected_call_args) { { agentIdx: 1 } }
      it 'calls command_guard with Hash and returns JSON' do
        expect_any_instance_of(clazz)
          .to receive(expected_call_method).with(expected_call_args).once
                                           .and_return(expected_call_args)
        expect(instance.inner_command_guard(packet))
          .to eql JSON.generate(agentIdx: 1)
      end
    end
    context 'called' do
      let(:expected_call_args) { {} }
      it 'calls command_guard with empty Hash and returns blank' do
        expect_any_instance_of(clazz)
          .to receive(expected_call_method).with(expected_call_args).once
                                           .and_return(expected_call_args)
        expect(instance.inner_command_guard(packet))
          .to be_blank
      end
    end
    context 'called' do
      let(:expected_call_args) { nil }
      it 'calls command_guard with nil and returns blank' do
        expect_any_instance_of(clazz)
          .to receive(expected_call_method).with(expected_call_args).once
                                           .and_return(expected_call_args)
        expect(instance.inner_command_guard(packet))
          .to be_blank
      end
    end
  end
end
