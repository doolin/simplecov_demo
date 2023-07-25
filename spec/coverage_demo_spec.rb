# frozen_string_literal: true

# Specs for simplecov demo

require 'ostruct'
require './lib/coverage_demo'

RSpec.describe CoverageDemo do
  subject(:cd) { described_class.new(foo, bar) }

  let(:foo) { false }
  let(:bar) { nil }
  let(:quux) do
    Class.new do
      attr_accessor :foo, :bar, :baz
    end.new.tap do |c|
      c.foo = 'foo'
      c.bar = 'bar'
    end
  end

  example 'do something' do
    expect(cd).not_to be_nil
  end

  describe '#if_coverage_only' do
    xcontext 'when "foo" is true' do
      it 'covers positive case' do
        cd = described_class.new(true)
        expect(cd.if_coverage_only).to be true
      end
    end

    context 'when "foo" is false' do
      it 'covers positive case' do
        cd = described_class.new(false)
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
        cd = described_class.new(foo, bar)
        # binding.irb
        expect(cd.endless).to be 0
      end
    end
  end

  describe '#quuxinator' do
    it 'quuxes' do
      foo = false
      bar = true
      cd = described_class.new(foo, bar)
      # binding.irb
      result = cd.quuxinator(quux)
      expect(result).to be 'bar'
    end
  end
end
