# frozen_string_literal: true

require 'rspec_helper'
require 'aiwolf/base'

RSpec.describe Aiwolf::Base do
  let(:clazz) do
    Struct.new(nil) do
      include Aiwolf::Base

      def hoge(arg)
        arg
      end

      def fuga(arg1, arg2)
        arg1 + arg2
      end
    end
  end
  subject(:instance) { clazz.new }

  it { is_expected.to respond_to(:receive_line, :unbind) }
  it { is_expected.to be_respond_to(:try, true) }

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
  describe '#try' do
    context 'called with the existed method, which has 1 arg' do
      let(:method_name) { :hoge }
      let(:args) { %w(hoge) }
      it 'calls the method via send and return hoge' do
        expect(instance.send(:try, method_name, *args))
          .to eql 'hoge'
      end
    end
    context 'called with the existed method, which has 2 arg' do
      let(:method_name) { :fuga }
      let(:args) { %w(hoge fuga) }
      it 'calls the method via send and return hogefuga' do
        expect(instance.send(:try, method_name, *args))
          .to eql 'hogefuga'
      end
    end
    context 'called with the non existed method name' do
      let(:method_name) { :piyo }
      it 'calls the method via send and return nil' do
        expect(instance.send(:try, method_name))
          .to be_nil
      end
    end
  end
end
