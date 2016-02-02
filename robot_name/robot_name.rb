class Robot
  NameCollisionError = Class.new(RuntimeError)

  NAME_ERROR_MSG = 'There was a problem generating the robot name!'.freeze

  attr_reader :name

  class << self
    attr_accessor :registry
  end
  @registry ||= []

  def initialize(args = {})
    @name = args.fetch(:name_generator, method(:generate_new_name)).call
    raise NameCollisionError, NAME_ERROR_MSG if invalid_name?
    Robot.registry << @name
  end

  private

  def generate_new_name
    "#{generate_char}#{generate_char}"\
    "#{generate_num}#{generate_num}#{generate_num}"
  end

  def generate_char
    ('A'..'Z').to_a.sample
  end

  def generate_num
    rand(10)
  end

  def invalid_name?
    !(name =~ /[[:alpha:]]{2}[[:digit:]]{3}/) || Robot.registry.include?(name)
  end
end

robot = Robot.new
puts "My pet robot's name is #{robot.name}, but we usually call him sparky."

# Errors!
generator = -> { 'AA111' }
Robot.new(name_generator: generator)
Robot.new(name_generator: generator)
