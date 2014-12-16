module MagicWords

  module ClassMethods
    require 'faker'

    def generator_methods(*fields)
      fields.each do |field|
        define_method field do

          case field
            when :personal_data
              {personal_data:{first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, prefix: Faker::Name.prefix, gender: %w(male female other).sample, age: rand(5..80)}}
            when :social_profiles
              {social_profiles:%w{Facebook Twitter VK LinkedIn}.sample(rand(0..4))}
            when :hobby
              {additional_info:{hobby: Faker::Lorem.words(1..8)}}
            when :internet_profile
              {internet_profile:{email: Faker::Internet.email, forum_user: Faker::Internet.user_name}}
            when :instant_messengers
              {instant_messengers:{skype: Faker::Internet.user_name, vider_whatsapp: Faker::PhoneNumber.cell_phone, icq: rand(100000..999999999)}}
            when :home
              {home:{country: Faker::Address.country, city: Faker::Address.city, street_address: Faker::Address.street_address, secondary_address: Faker::Address.secondary_address, home_phone: Faker::PhoneNumber.phone_number}}
            when :pets
              {additional_info:{pets: {name: Faker::Name.first_name}}}
            when :other
              {other:{some_text: Faker::Lorem.sentences(rand(1..5))}}
          end

        end
      end
    end
  end

  #avoid extend and include
  def self.included(base)
    base.extend(ClassMethods)
  end

end

class GenerateFields

  include MagicWords

  generator_methods :personal_data, :social_profiles, :hobby, :internet_profile, :instant_messengers, :home, :pets, :other

end
