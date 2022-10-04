class Cheese < ApplicationRecord

    def summary
        "id: #{self.id} #{self.name}: $#{self.price} #{self.is_best_seller}"
    end

end
