class RemoveTypeFromDatasets < ActiveRecord::Migration[5.0]
  def change
    remove_column :datasets, :type, :string
  end
end
