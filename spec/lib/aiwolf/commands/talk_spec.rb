# frozen_string_literal: true

require 'rspec_helper'
require 'aiwolf/commands/talk'

RSpec.describe Aiwolf::Commands::Talk do
  let(:clazz) do
    Struct.new(nil) do
      include Aiwolf::Commands::Talk
    end
  end
  subject(:instance) { clazz.new }

  it { is_expected.to respond_to(:inner_command_talk) }

  describe '#inner_command_talk' do
    let(:expected_call_method) { :command_talk }
    let(:packet) { { gameInfo: expected_call_args } }
    context 'called' do
      let(:expected_call_args) { 'HOGE' }
      it 'calls command_talk and returns HOGE' do
        expect_any_instance_of(clazz)
          .to receive(expected_call_method).with(expected_call_args).once
                                           .and_return(expected_call_args)
        expect(instance.inner_command_talk(packet))
          .to eql expected_call_args
      end
    end
    context 'called' do
      let(:expected_call_args) { {} }
      it 'calls command_talk and returns none as default' do
        expect_any_instance_of(clazz)
          .to receive(expected_call_method).with(expected_call_args).once
                                           .and_return(nil)
        expect(instance.inner_command_talk(packet))
          .to be_blank
      end
    end
  end
end
