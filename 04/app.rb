require './person_parser'

RESPONSE='{"person":{
            "personal_data":{
              "name": "John Smith",
              "gender": "male",
              "age":60
            },
            "social_profiles":["Facebook", "Twitter", "VK", "LinkedIn"],
            "additional_info":{
              "hobby": ["pubsurfing","drinking","hiking"],
              "pets": [{"name":"Mittens","species":"Felis silvestris catus"}]
            }
          }}'

proc = Processor
person = proc.parse(RESPONSE)

name = proc.has_name?(person.personal_data['name'])
gender = proc.gender?(person.personal_data['gender'])[0]
pronoun = proc.gender?(person.personal_data['gender'])[1]
possessive = proc.gender?(person.personal_data['gender'])[2]
adult = proc.adult?(person.personal_data['age'])
hobby = proc.has_hobbies?(person.additional_info['hobby'])
pets = proc.has_pets?(person.additional_info['pets'])
social = proc.has_social_profiles?(person.social_profiles)


puts 'Who do we have here?'
puts "It's #{person.personal_data['name'] || name}, #{pronoun} is #{adult} #{person.personal_data['age']} years old #{gender}."
if hobby
  print "#{possessive.capitalize} hobbies are:"
  person.additional_info['hobby'].each {|hobby| print " #{hobby}"}
  print ".\n"
end
if social
  print "#{possessive.capitalize} social profiles are:"
  person.social_profiles.each  {|profile| print " #{profile}"}
  print ".\n"
end
if pets
  person.additional_info['pets'].each do |pet|
    print "Pet's name is #{pet['name']} and it is a #{pet['species']}.\n"
  end
end
