# frozen_string_literal: true

# Specs for simplecov demo

require 'ostruct'
require './lib/coverage_demo'

# file:///Users/daviddoolin/src/simplecov_demo/coverage/index.html#_AllFiles

RSpec.describe CoverageDemo do
  subject(:cd) { described_class.new(foo, bar) }

  let(:foo) { false }
  let(:bar) { nil }
  let(:quux) do
    Class.new do
      attr_accessor :foo, :bar, :baz
    end.new.tap do |c|
      c.foo = foo # 'foo'
      c.bar = bar # 'bar'
    end
  end

  describe '#if_coverage_only' do
    context 'when "foo" is true' do
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

  # This spec finds both line and branch coverage, even when
  # only one case is tested. It doesn't matter which case, true
  # or false is tested. However, note that testing one case results
  # in the coverage report showing 1 hit on the ternary line. When
  # both cases are tested, then the coverage report will show 2 hits
  # on the ternary line.
  describe '#foo_ternary' do
    context 'when "foo" is false' do
      it 'returns false' do
        expect(cd.foo_ternary).to be false
      end
    end

    context 'when "foo" is true' do
      let(:foo) { true }

      it 'returns true' do
        expect(cd.foo_ternary).to be true
      end
    end
  end

  describe '#foo_and_bar' do
    context 'when true' do
      it 'returns 0' do
        foo = true
        bar = true
        cd = described_class.new(foo, bar)

        expect(cd.foo_and_bar).to be 0
      end
    end

    context 'when false' do
      it 'returns 1' do
        foo = false
        bar = true
        cd = described_class.new(foo, bar)

        expect(cd.foo_and_bar).to be 1
      end
    end
  end

  describe '#endless' do
    context 'when true' do
      xit 'returns 0' do
        foo = true
        bar = true
        cd = described_class.new(foo, bar)

        expect(cd.endless).to be 0
      end
    end

    context 'when false' do
      it 'returns 1' do
        foo = false
        bar = true
        cd = described_class.new(foo, bar)

        expect(cd.endless).to be 1
      end
    end
  end

  describe '#quuxinator' do
    let(:foo) { true }
    let(:bar) { true }

    it 'quuxes' do
      foo = true # false
      bar = true
      cd = described_class.new(foo, bar)
      # binding.irb
      result = cd.quuxinator(quux)
      expect(result).to be 'foo'
    end

    it 'quuxes' do
      foo = false
      bar = true
      quux.foo = false
      cd = described_class.new(foo, bar)
      # binding.irb
      result = cd.quuxinator(quux)
      expect(result).to be 'bar'
    end

    it 'quuxes' do
      foo = false
      bar = true
      quux.foo = false
      quux.bar = false
      cd = described_class.new(foo, bar)
      # binding.irb
      result = cd.quuxinator(quux)
      expect(result).to be nil
    end
  end
end
