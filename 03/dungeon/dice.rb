class RollDice

  def roll
    rand(20)+1
  end

end

# dice = RollDice.new
#
# rolls = Array.new
#
# 10000.times { |x| rolls.insert(x, dice.roll)}
#
# stats = Hash.new
#
# rolls.each { |roll| stats[roll] += 1 }
#
# stats.each {|k, v| puts "#{k} rolled \t #{v} times"}