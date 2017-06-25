# frozen_string_literal: true

require 'rspec_helper'
require 'aiwolf/cli'

RSpec.describe Aiwolf::CLI do
  subject(:instance) { described_class.new }

  let!(:test_class) do
    class AiClassName
    end
  end
  let(:test_class_name) { 'AiClassName' }

  it { is_expected.to respond_to(:execute) }

  describe '#execute' do
    context 'called' do
      let(:options) { { host:'127.0.0.1', port: 10000 } }
      it 'calls with options' do
        expect(EventMachine)
          .to receive(:run)
        expect_any_instance_of(Logger)
          .to receive(:info)
          .with('Connecting to 127.0.0.1:10000 with AiClassName')
        instance.invoke(:execute, [test_class_name], options)
      end
    end
  end
  describe '#load_ai_class' do
    context 'called with AiClassName' do
      it 'returns the class of AiClassName' do
        expect_any_instance_of(described_class)
          .to receive(:require).with('ai_class_name')
        expect(instance.send(:load_ai_class, test_class_name))
          .to eql AiClassName
      end
    end
  end
end
