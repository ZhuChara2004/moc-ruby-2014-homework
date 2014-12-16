require './generate_json'

RESPONSE = GenerateJson.new.generate

response = JSON.parse(RESPONSE)


if response.key?("person")

  p response["person"].keys

  Struct.new("Person", *response["person"].keys.collect(&:to_sym))

  person2 = Struct::Person.new(*response["person"].values)

  p person2.inspect

end