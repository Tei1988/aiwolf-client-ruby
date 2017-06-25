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
    let(:expected_call_method) { :command_vote }
    let(:packet) { { gameInfo: expected_call_args } }
    context 'called' do
      let(:expected_call_args) { { agentIdx: 1 } }
      it 'calls command_vote with Hash and return JSON' do
        expect_any_instance_of(clazz)
          .to receive(expected_call_method).with(expected_call_args).once
                                           .and_return(expected_call_args)
        expect(instance.inner_command_vote(packet))
          .to eql JSON.generate(expected_call_args)
      end
    end
    context 'called' do
      let(:expected_call_args) { {} }
      it 'calls command_vote with empty Hash and return blank' do
        expect_any_instance_of(clazz)
          .to receive(expected_call_method).with(expected_call_args).once
                                           .and_return(expected_call_args)
        expect(instance.inner_command_vote(packet))
          .to be_blank
      end
    end
    context 'called' do
      let(:expected_call_args) { nil }
      it 'calls command_vote with nil and return blank' do
        expect_any_instance_of(clazz)
          .to receive(expected_call_method).with(expected_call_args).once
                                           .and_return(expected_call_args)
        expect(instance.inner_command_vote(packet))
          .to be_blank
      end
    end
  end
end
