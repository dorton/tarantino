class AddProfaneToDatasets < ActiveRecord::Migration[5.0]
  def change
    add_column :datasets, :profane_word, :string
  end
end
