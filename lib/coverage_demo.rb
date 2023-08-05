# frozen_string_literal: true

# SimpleCov demo

# An example class for demonstrating how SimpleCov
# reports branch and line coverage.
class CoverageDemo
  attr_reader :foo, :bar

  def initialize(foo, bar = nil)
    @foo = foo
    @bar = bar
  end

  def if_coverage_only
    @baz = if foo
             true
           else
             false
           end
  end

  # SimpleCov will report line and branch coverage on
  # the following method containing a ternary expression.
  def foo_ternary
    foo ? true : false
  end

  def foo_and_bar
    foo && bar ? 0 : 1
  end

  def endless = foo && bar ? 0 : 1

  # This doesn't work the way I want with & operator.
  # Need to set quux to nil, or set up an example like
  # baz = nil, baz.foo
  def quuxinator(quux)
    # binding.irb
    # Part of the problem here is that the comparision is between
    # foo boolean and quux.foo string.
    if foo && quux.foo
      'foo'
    elsif quux.bar
      'bar'
    end
  end
end
