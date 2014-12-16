require './generate_json'

RESPONSE = GenerateJson.new.generate

parse = JSON.parse(RESPONSE)

Struct.new('Person', *parse['person'].keys.collect(&:to_sym))

person = Struct::Person.new(*parse['person'].values)

puts person.inspect
