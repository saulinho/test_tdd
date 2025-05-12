class AddColumnsToCustomer < ActiveRecord::Migration[8.0]
  def change
    add_column :customers, :vip, :boolean
    add_column :customers, :days_to_pay, :integer
  end
end
