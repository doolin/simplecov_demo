# frozen_string_literal: true
# Specs for simplecov demo

require './lib/demo'

RSpec.describe CoverageDemo do
  example 'do something' do
    expect(CoverageDemo.new).to_not be nil
  end
end