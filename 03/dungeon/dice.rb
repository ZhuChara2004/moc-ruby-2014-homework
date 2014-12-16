class RollDice

  types = [4, 6, 8, 10, 12, 20]

  types.each do |t|
    define_method("d#{t}") { rand(t)+1 }
  end

end
