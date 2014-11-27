class Person
  def initialize(fname, lname)
    @fname = fname
    @lname = lname
  end
end

class Client < Person
  def initialize(driving_license)
    @driving_license = driving_license
  end

  def pay
    puts 'You\'re paying.'
  end

  def take_car
    puts 'Car taken.'
  end

  def return_car
    puts 'Car returned'
  end
end

class Manager < Person
  def initialize(employee_id)
    @employee_id = employee_id
  end

  def car_search
    puts 'Searching car.'
  end

  def accept_payment
    puts 'Payment accepted.'
  end

  def give_car
    puts 'Car given.'
  end

  def check_car
    puts 'The car is all right'
  end
end

class Car
  attr_accessor :driver_id
  attr_accessor :rental_duration

  def status

  end
end