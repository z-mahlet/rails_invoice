class Customer < ApplicationRecord
    has_many :invoices, dependent: :destroy
    validates :name , presence:true
    validates :code , presence:true , uniqueness:true
end
