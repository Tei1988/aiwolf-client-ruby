# frozen_string_literal: true

require 'rspec_helper'
require 'aiwolf/base/logger'

RSpec.describe Aiwolf::Base::Logger do
  let(:clazz) do
    Struct.new(nil) do
      include Aiwolf::Base::Logger
    end
  end
  subject(:instance) { clazz.new }

  it { is_expected.to respond_to(:logger=, :logger) }

  describe '#logger' do
    context 'called' do
      it 'returns Logger' do
        expect(instance.logger)
          .to be_kind_of(Logger)
      end
    end
    context 'called after assigns' do
      let(:logger) { Logger.new(STDOUT) }
      before { instance.logger = logger}
      it 'returns Logger' do
        expect(instance.logger)
          .to eql logger
      end
    end
  end
end
