module ProcessJson
  require 'json'

  module ClassMethods
    def parse(income = [])

      parse = JSON.parse(income)

      Struct.new('Person', *parse['person'].keys.collect(&:to_sym))

      Struct::Person.new(*parse['person'].values)

    end

    def has_name?(name)
      true if name != nil
      'unnamed person' if name == nil
    end

    def adult?(age)
      return 'immortal' if age == nil
      age >= 18 ? 'an adult' : 'not adult'
    end

    def gender?(gender)
      if gender != nil
        if gender == 'male'
          %w(male he his)
        elsif gender == 'female'
          %w(female she her)
        else
          %w(other it its)
        end
      else
        %w(none it its)
      end
    end


    def has_hobbies?(hobby)
      true if hobby != nil
    end

    def has_pets?(pets)
      true if pets != nil
    end

    def has_social_profiles?(profiles)
      true if profiles != nil
    end
  end

  #avoid extend and include
  def self.included(base)
    base.extend(ClassMethods)
  end


end

class Processor

  include ProcessJson

end
