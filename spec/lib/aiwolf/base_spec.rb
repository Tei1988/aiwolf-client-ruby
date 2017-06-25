# frozen_string_literal: true

require 'rspec_helper'
require 'aiwolf/base'

RSpec.describe Aiwolf::Base do
  let(:clazz) do
    Struct.new(nil) do
      include Aiwolf::Base
    end
  end
  subject(:instance) { clazz.new }

  it { is_expected.to respond_to(:receive_line, :unbind) }

  describe '#receive_line' do
    context 'called with JSON' do
      let(:received_data) { JSON.generate({}) }
      it 'calls parse_command and send_data' do
        expect_any_instance_of(clazz)
          .to receive(:parse_command).once.and_return('OK')
        expect_any_instance_of(clazz)
          .to receive(:send_data).once
        instance.receive_line(received_data)
      end
    end
    context 'called with non JSON string' do
      let(:received_data) { 'hoge' }
      it 'raises JSON::ParserError' do
        expect { instance.receive_line(received_data) }
          .to raise_error(JSON::ParserError)
      end
    end
  end
  describe '#unbind' do
    context 'called' do
      it 'calls EventMachine::stop_event_loop' do
        expect(EventMachine)
          .to receive(:stop_event_loop).once
        instance.unbind
      end
    end
  end
end
