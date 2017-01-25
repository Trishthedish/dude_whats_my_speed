class AddServiceProviderToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :service_provider, :string
  end
end
