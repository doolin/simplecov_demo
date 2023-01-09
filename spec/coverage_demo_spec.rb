# frozen_string_literal: true
# Specs for simplecov demo

require './lib/coverage_demo'

RSpec.describe CoverageDemo do
  let(:foo) { false }
  let(:bar) { nil }
  let(:quux) { OpenStruct.new(foo: 'foo', bar: 'bar') }

  subject(:cd) { CoverageDemo.new(foo, bar) }

  example 'do something' do
    expect(cd).to_not be nil
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

  describe '#foo_ternary' do
    # This spec finds both line and branch coverage, even though
    # only the false case is tested.
    it 'returns true' do
      expect(cd.foo_ternary).to be false
    end
  end

  describe '#foo_and_bar' do
    context 'true case' do
      it 'returns 0' do
        foo = true
        bar = true
        cd = CoverageDemo.new(foo, bar)
        # binding.irb
        expect(cd.endless).to be 0
      end
    end
  end
end