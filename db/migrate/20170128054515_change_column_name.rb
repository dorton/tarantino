class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :datasets, :movie, :movie_name
  end
end
