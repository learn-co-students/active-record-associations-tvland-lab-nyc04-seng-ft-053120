class Show < ActiveRecord::Base
  has_many :characters
  has_many :actors, through: :characters
  belongs_to :network

  def actors_list
    characters_array = Character.where(show_id: self.id)
    actor_id_array = characters_array.map { |c| c.actor_id }
    actor_id_array.map { |id| Actor.find(id).full_name }
  end
end