# frozen_string_literal: true

require 'rspec_helper'
require 'aiwolf/commands/daily_finish'

RSpec.describe Aiwolf::Commands::DailyFinish do
  let(:clazz) do
    Struct.new(nil) do
      include Aiwolf::Commands::DailyFinish
    end
  end
  subject(:instance) { clazz.new }

  it { is_expected.to respond_to(:inner_command_daily_finish) }

  describe '#inner_command_daily_finish' do
    let(:expected_call_method) { :command_daily_finish }
    let(:packet) { { gameInfo: expected_call_args } }
    context 'called' do
      let(:expected_call_args) { { agentIdx: 1 } }
      it 'calls command_daily_finish with Hash and returns nil' do
        expect_any_instance_of(clazz)
          .to receive(expected_call_method).with(expected_call_args).once
                                           .and_return(expected_call_args)
        expect(instance.inner_command_daily_finish(packet))
          .to be_nil
      end
    end
    context 'called' do
      let(:expected_call_args) { {} }
      it 'calls command_daily_finish with empty Hash and returns nil' do
        expect_any_instance_of(clazz)
          .to receive(expected_call_method).with(expected_call_args).once
                                           .and_return(expected_call_args)
        expect(instance.inner_command_daily_finish(packet))
          .to be_nil
      end
    end
    context 'called' do
      let(:expected_call_args) { nil }
      it 'calls command_daily_finish with nil and returns nil' do
        expect_any_instance_of(clazz)
          .to receive(expected_call_method).with(expected_call_args).once
                                           .and_return(expected_call_args)
        expect(instance.inner_command_daily_finish(packet))
          .to be_nil
      end
    end
  end
end
