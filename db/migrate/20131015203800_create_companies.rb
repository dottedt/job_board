class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.boolean :show_address
      t.string :url
      t.boolean :show_as_customer

      t.timestamps
    end
  end
end
