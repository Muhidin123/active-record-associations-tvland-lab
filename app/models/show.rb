class Show < ActiveRecord::Base
    has_many :characters
    has_many :actors, through: :characters
    belongs_to :network


    def actors_list
        Character.all.select {|chr| chr.show_id == self.id}.map {|show| show.actor.itself.full_name}
    end
end

