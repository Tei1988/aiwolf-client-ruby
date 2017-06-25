# frozen_string_literal: true

require 'rspec_helper'
require 'aiwolf/commands/role'

RSpec.describe Aiwolf::Commands::Role do
  let(:clazz) do
    Struct.new(nil) do
      include Aiwolf::Commands::Role
    end
  end
  subject(:instance) { clazz.new }

  it { is_expected.to respond_to(:inner_command_role) }

  describe '#inner_command_role' do
    let(:expected_call_method) { :command_role }
    let(:packet) { { gameInfo: expected_call_args } }
    context 'called' do
      let(:expected_call_args) { { agentIdx: 1 } }
      it 'calls command_role and returns ROLE' do
        expect_any_instance_of(clazz)
          .to receive(expected_call_method).with(no_args).once
                                           .and_return('ROLE')
        expect(instance.inner_command_role(packet))
          .to eql 'ROLE'
      end
    end
    context 'called' do
      let(:expected_call_args) { {} }
      it 'calls command_role and returns none as default' do
        expect_any_instance_of(clazz)
          .to receive(expected_call_method).with(no_args).once
                                           .and_return(nil)
        expect(instance.inner_command_role(packet))
          .to eql 'none'
      end
    end
  end
end
