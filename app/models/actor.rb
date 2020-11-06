class Actor < ActiveRecord::Base
    has_many :characters
    has_many :shows, through: :characters


    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    def get_roles
        Character.all.select {|characters| characters.actor == self}
    end


    def list_roles
        arr = get_roles.map {|character| character.name} << get_roles.map {|character| character.show.name}
        arr.flatten.join(" - ")
    end
end