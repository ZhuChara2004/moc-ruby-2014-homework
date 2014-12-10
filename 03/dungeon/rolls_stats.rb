# require '~/MoC-RoR/moc-ruby-2014-homework/03/dungeon/dice.rb'
require './dice'


dice = RollDice.new

rolls = []

freq = Hash.new(0)

rolldice_methods = RollDice.instance_methods(false)

puts 'Dice Types Present:'

puts   '╔════╦═══════════╗'
puts   '║ No ║ Dice Type ║'

rolldice_methods.each_with_index do |item, index|
  puts '╠════╬═══════════╣'
  puts "║ #{index+1}  ║    #{item.to_s}\t ║"
end

puts   '╚════╩═══════════╝'

print 'Select number of dice type: '
d = gets.chomp.to_i - 1
if d >= 0 && d <= rolldice_methods.index(rolldice_methods.last)
  print 'Enter number of rolls: '

  n = gets.chomp.strip.to_i

  n.times {|r| rolls.insert(r, dice.send(rolldice_methods[d]))}

  rolls.each {|r| freq[r] += 1}

  puts "You've rolled dice for #{n} times. And the result is: \n"

  puts   '════════╦════════════════════════════════'
  puts   '  Tile  ║ Frequency '

  freq.sort.each do |k, v|
    puts '════════╬════════════════════════════════'
    puts "   #{k}\t║  #{v} "
  end
  puts   '════════╩════════════════════════════════'
else
  print 'Wrong input!'
end
