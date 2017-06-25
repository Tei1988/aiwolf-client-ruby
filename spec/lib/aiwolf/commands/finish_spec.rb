# frozen_string_literal: true

require 'rspec_helper'
require 'aiwolf/commands/finish'

RSpec.describe Aiwolf::Commands::Finish do
  let(:clazz) do
    Struct.new(nil) do
      include Aiwolf::Commands::Finish

      def command_finish(game_info)
        game_info
      end
    end
  end
  subject(:instance) { clazz.new }

  it { is_expected.to respond_to(:inner_command_finish) }

  describe '#inner_command_finish' do
    let(:expected_call_method) { :command_finish }
    let(:packet) { { gameInfo: expected_call_args } }
    context 'called' do
      let(:expected_call_args) { nil }
      it 'calls EventMachine::stop_event_loop returns nil' do
        expect(EventMachine)
          .to receive(:stop_event_loop).once
        expect_any_instance_of(clazz)
          .to receive(expected_call_method).with(expected_call_args).once
                                           .and_return(expected_call_args)
        expect(instance.inner_command_finish(packet))
          .to be_nil
      end
    end
  end
end
