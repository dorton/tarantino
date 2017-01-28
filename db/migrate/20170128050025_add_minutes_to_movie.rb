class AddMinutesToMovie < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :minutes, :integer
  end
end
