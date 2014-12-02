# require '~/MoC-RoR/moc-ruby-2014-homework/03/dungeon/dice.rb'
require './dice'

dice = RollDice.new

rolls = []

freq = Hash.new(0)

print 'Enter number of rolls: '
n = gets.chomp.strip.to_i

puts "You've rolled dice for #{n} times. And the result is: \n"

n.times {|r| rolls.insert(r, dice.roll)}

rolls.each {|r| freq[r] += 1}

freq.sort.each {|k, v| puts "#{k}: \t #{v}"}