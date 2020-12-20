# frozen_string_literal: true

DFARulebook = Struct.new(:rules) do
  def next_state(state, character)
    rule_for(state, character).follow
  end

  private

  def rule_for(state, character)
    rules.detect { |rule| rule.applies_to?(state, character) }
  end
end
