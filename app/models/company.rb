class Company < ActiveRecord::Base
  validates :name, :address, :url, presence: true
  validates :show_address, inclusion: {in: [true, false], message: 'requires a true or false value'}
  validates :show_as_customer,  inclusion: {in: [true, false], message: 'requires a true or false value'}
  validates :url, presence: true, uri: { format: /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix }
end
