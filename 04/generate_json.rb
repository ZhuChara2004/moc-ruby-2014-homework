require './generate_fields'

class GenerateJson
  require 'json'

  def generate
    fields_hash = {}
    json_hash = {person: {}}
    field_types = GenerateFields.instance_methods(false)
    number_of_fields = field_types.count

    generator = GenerateFields.new

    rand(0..(number_of_fields+1)).times do
      fields_hash.merge!(generator.send(field_types[rand(number_of_fields)]))
    end

    puts fields_hash

    json_hash[:person].merge!(fields_hash)

    JSON.generate(json_hash)
  end

end

