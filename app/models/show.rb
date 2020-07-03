class Show < ActiveRecord::Base
  has_many :characters
  has_many :actors, through: :characters
  belongs_to :network

  def actors_list
    # returns an Array of the full names of each actor associated with the a show
    self.actors.map { |actor| actor.full_name }
  end
end