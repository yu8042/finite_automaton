# frozen_string_literal: true

Dir['*.rb'].each { |file| require_relative file }

rulebook = DFARulebook.new([
                             FARule.new(1, 'a', 2),
                             FARule.new(1, 'b', 1),
                             FARule.new(2, 'a', 2),
                             FARule.new(2, 'b', 3),
                             FARule.new(3, 'a', 3),
                             FARule.new(3, 'b', 3)
                           ])
dfa_design = DFADesign.new(1, [3], rulebook)
puts dfa_design.accepts?('a')
puts dfa_design.accepts?('baa')
puts dfa_design.accepts?('baba')

rulebook = NFARulebook.new([
                             FARule.new(1, nil, 2),
                             FARule.new(1, nil, 4),
                             FARule.new(2, 'a', 3),
                             FARule.new(3, 'a', 2),
                             FARule.new(4, 'a', 5),
                             FARule.new(5, 'a', 6),
                             FARule.new(6, 'a', 4)
                           ])
nfa_design = NFADesign.new(1, [2, 4], rulebook)
puts nfa_design.accepts?('aa')
puts nfa_design.accepts?('aaa')
puts nfa_design.accepts?('aaaaa')
puts nfa_design.accepts?('aaaaaa')
