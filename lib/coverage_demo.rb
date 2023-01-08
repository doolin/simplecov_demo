# frozen_string_literal: true

# SimpleCov demo

# An example class for demonstrating how SimpleCov
# reports branch and line coverage.
class CoverageDemo
  attr_reader :foo

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
end
