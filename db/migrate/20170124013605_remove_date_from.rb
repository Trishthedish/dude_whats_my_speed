class RemoveDateFrom < ActiveRecord::Migration[5.0]
  def change
    remove_column :rasberry_pis, :date, :string
  end
end
