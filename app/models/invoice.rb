class Invoice < ApplicationRecord
  belongs_to :customer
  has_many :invoice_items, dependent: :destroy
  has_many :items, through: :invoice_items

  enum :status, { pending: 0, in_progress: 1, completed: 2 }
  
  validates :invoice_number, presence: true, uniqueness: true
  validates :generated_on, :status, :customer, presence: true
end