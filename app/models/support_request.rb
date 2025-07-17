class SupportRequest < ApplicationRecord

    belongs_to :order, optional: true #not all support requests will be linked to an order. 
                                      #For example, a user might submit a support request before 
                                      #making any order.
        has_rich_text :response
end
