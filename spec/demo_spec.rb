# frozen_string_literal: true
# Specs for simplecov demo

require './lib/coverage_demo'

RSpec.describe CoverageDemo do
  example 'do something' do
    expect(CoverageDemo.new(false)).to_not be nil
  end

  describe '#if_coverage_only' do
    xcontext 'when "foo" is true' do
      it 'covers positive case' do
        cd = CoverageDemo.new(true)
        expect(cd.if_coverage_only).to be true
      end
    end

    context 'when "foo" is false' do
      it 'covers positive case' do
        cd = CoverageDemo.new(false)
        expect(cd.if_coverage_only).to be false
      end
    end
  end
end