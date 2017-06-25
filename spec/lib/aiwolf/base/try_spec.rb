# frozen_string_literal: true

require 'rspec_helper'
require 'aiwolf/base/try'

RSpec.describe Aiwolf::Base::Try do
  let(:clazz) do
    Struct.new(nil) do
      include Aiwolf::Base::Try

      def hoge(arg)
        arg
      end

      def fuga(arg1, arg2)
        arg1 + arg2
      end
    end
  end
  subject(:instance) { clazz.new }

  it { is_expected.to be_respond_to(:try, true) }

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
