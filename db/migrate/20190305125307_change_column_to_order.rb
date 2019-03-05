class ChangeColumnToOrder < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :status, :string, :default => "waiting for payment"
  end
end
