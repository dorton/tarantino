class AddEventToDatasets < ActiveRecord::Migration[5.0]
  def change
    add_column :datasets, :event, :string
  end
end
