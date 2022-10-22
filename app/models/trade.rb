class Trade < ApplicationRecord
  belongs_to :user
  belongs_to :book
  #todo missing the date of trade and return
  #todo adapt the relation between the other models and the trade
end
