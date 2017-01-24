class RemoveServiceProviderFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :service_provider, :string
  end
end
