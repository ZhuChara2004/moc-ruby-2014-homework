class Character

  attr_accessor :str, :con, :dex, :int, :wis, :cha

  def initialize(character_name, character_race, character_class, character_homeland, character_deity)
    @character_name = :character_name
    @character_race = :character_race
    @character_class = :character_class
    @character_place_of_birth = :character_homeland
    @character_deity = :character_deity
  end

  def character_info
    # Short description.
  end

  def character_full_info
    # Biography, stats, class etc.
  end



end
