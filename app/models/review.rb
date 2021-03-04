class Review < ApplicationRecord
    belongs_to :book
    belongs_to :user 
    validates(:content, { :length => { :maximum => 20 } })
end
