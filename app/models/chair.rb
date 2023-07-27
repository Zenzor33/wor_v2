class Chair < ApplicationRecord
    def self.available
        where("available_from < ?", Time.now).order("available_from")
    end
end
