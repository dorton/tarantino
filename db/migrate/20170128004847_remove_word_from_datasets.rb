class RemoveWordFromDatasets < ActiveRecord::Migration[5.0]
  def change
    remove_column :datasets, :word, :string
  end
end
