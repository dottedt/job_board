class Company < ActiveRecord::Base
  validates :name, :address, :url, :show_address, :show_as_customer, presence: true
  validates :show_address, inclusion: { in: [true, false] }
end
