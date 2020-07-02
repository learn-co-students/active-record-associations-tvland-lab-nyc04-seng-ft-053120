class Character < ActiveRecord::Base
  belongs_to :actor
  belongs_to :show

  def say_that_thing_you_say
    "#{self.name} always says: #{self.catchphrase}"
  end

  def build_show(name)
    Show.create(name).characters << self
    self
  end

  def build_network(call_letters)
    Network.create(call_letters).shows << self.show
  end
end