class AddStripefieldsToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :stripe_customer_id, :string
    add_column :orders, :stripe_email, :string
    add_column :orders, :currency, :string
    add_column :orders, :description, :string
  end
end
