

labels = %w(Sony Warner Epic MCA Fox Play)
prices = {
  sony: 5495,
  warner: 5995,
  epic: 3295,
  mca: 4745,
  fox: 3615,
  play: 2790
}

puts prices

puts 'Please select label: '
puts

puts   '╔════╦═══════════╦═══════════════╗'
puts   "║ No ║ Label\t ║ Price/month\t ║"
labels.each_with_index do |item,index|
  puts '╠════╬═══════════╬═══════════════╣'
  puts "║ #{index+1}  ║ #{item}\t ║ $#{prices[item.downcase.to_sym].to_f.round(2)/100}\t ║"
end
puts   '╚════╩═══════════╩═══════════════╝'
puts

print 'Enter number of label: '
labelSelection = gets.chomp.strip.to_i - 1
puts

label = labels[labelSelection]
price = prices[label.downcase.to_sym]

print 'Choose period in months: '
period = gets.chomp.strip.to_i
sum = price.to_f * period

puts "Your label is #{label}! You'll have to pay $#{sum/100} "