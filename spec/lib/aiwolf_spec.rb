# frozen_string_literal: true

require 'rspec_helper'

RSpec.describe Aiwolf do
  it 'has a version number' do
    expect(Aiwolf::VERSION).not_to be nil
  end
end
