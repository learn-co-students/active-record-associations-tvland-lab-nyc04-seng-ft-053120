class Actor < ActiveRecord::Base
    has_many :characters
    has_many :shows, through: :characters

    #that returns the first and last name of an actor.
    def full_name
        self.first_name + " " + self.last_name
    end

    def list_roles
        self.characters.map {|c| c.name + " - " + c.show.name}
    end



end