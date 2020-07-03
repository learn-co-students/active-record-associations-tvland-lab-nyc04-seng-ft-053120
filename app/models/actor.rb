class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters
  
  def full_name
    self.first_name + " " + self.last_name
  end

  def all_characters
    Character.all.select { |character| character.actor_id == self.id }
  end

  def list_roles
    self.all_characters.map { |character| "#{character.name} - #{character.show.name}" }
  end
end