# field_types = [ :username, :name, :email, :social, :skype, :cell_phone, phone ]

class GenerateJson
  require 'faker'
  require 'json'

  def name
    name = Faker::Name.name
    JSON.generate({field_name: 'Name', field_type: 'full_name', field_content: name})
  end

  def email
    email = Faker::Internet.free_email
    JSON.generate({field_name: 'Email', field_type: 'email', field_content: email})
  end

  def username
    username = Faker::Internet.user_name
    JSON.generate({field_name: 'Username', field_type: 'forum_username', field_content: username})
  end

  def social
    social = %w(Facebook Twitter VK LinkedIn)
    JSON.generate({field_name: 'Social', field_type: 'social_profile', field_content: social[rand(social.length)]})
  end

  def skype
    skype_name = Faker::Internet.user_name
    JSON.generate({field_name: 'Skype', field_type: 'skype_name', field_content: skype_name})
  end

  def cell_phone
    cell_phone = Faker::PhoneNumber.cell_phone
    JSON.generate({field_name: 'Cell phone', field_type: 'cell_phone', field_content: cell_phone})
  end

  def phone
    phone = Faker::PhoneNumber.phone_number
    JSON.generate({field_name: 'Phone', field_type: 'skype_name', field_content: phone})
  end
end
