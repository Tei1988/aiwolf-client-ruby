# frozen_string_literal: true

require 'rspec_helper'
require 'aiwolf/base/command_parser'

RSpec.describe Aiwolf::Base::CommandParser do
  let(:clazz) do
    Struct.new(nil) do
      include Aiwolf::Base::CommandParser

      def inner_command_hoge(packet)
        true
      end
    end
  end
  subject(:instance) { clazz.new }

  it { is_expected.to respond_to(:parse_command) }

  describe '#parse_command' do
    context 'called with Hash having request as HOGE' do
      let(:packet) { { request: 'HOGE' } }
      it 'calls inner_command_hoge via send' do
        expect(instance.parse_command(packet))
          .to be_truthy
      end
    end
    context 'called with Hash having request' do
      let(:packet) { { request: 'FUGA' } }
      it 'raises NoMethodError' do
        expect { instance.parse_command(packet) }
          .to raise_error(NoMethodError)
      end
    end
    context 'called with Hash not having request' do
      let(:packet) { {} }
      it 'raises NoMethodError' do
        expect { instance.parse_command(packet) }
          .to raise_error(NoMethodError)
      end
    end
  end
end
