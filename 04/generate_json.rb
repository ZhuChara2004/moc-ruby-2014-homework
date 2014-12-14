# field_types = [ :username, :name, :email, :social, :skype, :cell_phone, phone ]

# RESPONSE='{"person":{
#                       "personal_data":{"name": "John Smith", "gender":"male", "age":56 ......},
#                       "social_profiles":["http://facebook....","http://twitter...","http://", .... ],
#                       "additional_info":{"hobby":["pubsurfing","drinking","hiking"...],
#                       "pets":[{"name":"Mittens","species":"Felis silvestris catus"},],...
#                       }
#                     }'

module JsonGenerator
  require 'faker'
  require 'json'

  module ClassMethods

    def generator_methods(*fields)

      fields.each do |field|
        define_method field do

          case field
            when :personal_data
              JSON.generate(personal_data:{name: Faker::Name.name, gender: %w(male female other).sample, age: "#{rand(5..80)}"})
            when :social_profiles
              JSON.generate(social_profiles:{})
          end


        end
      end

    end

  end

end











class GenerateJson
  require 'faker'
  require 'json'

  attr_writer :number

  field_types = ['name','email','forum_username','social','skype_name','cell_phone','phone']
  field_names = ['Name', 'Email', 'Username', 'Social', 'Skype', 'Cell phone', 'Phone']




  def self.name
    name = Faker::Name.name
    JSON.generate({field_name: 'Name', field_type: 'name', field_content: name})
  end

  def self.email
    email = Faker::Internet.free_email
    JSON.generate({field_name: 'Email', field_type: 'email', field_content: email})
  end

  def self.username
    forum_username = Faker::Internet.user_name
    JSON.generate({field_name: 'Username', field_type: 'forum_username', field_content: forum_username})
  end

  def self.social
    social = %w(Facebook Twitter VK LinkedIn)
    JSON.generate({field_name: 'Social', field_type: 'social_profile', field_content: social[rand(social.length)]})
  end

  def self.skype
    skype_name = Faker::Internet.user_name
    JSON.generate({field_name: 'Skype', field_type: 'skype_name', field_content: skype_name})
  end

  def self.cell_phone
    cell_phone = Faker::PhoneNumber.cell_phone
    JSON.generate({field_name: 'Cell phone', field_type: 'cell_phone', field_content: cell_phone})
  end

  def self.phone
    phone = Faker::PhoneNumber.phone_number
    JSON.generate({field_name: 'Phone', field_type: 'phone', field_content: phone})
  end
end
