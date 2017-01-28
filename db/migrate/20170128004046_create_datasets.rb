class CreateDatasets < ActiveRecord::Migration[5.0]
  def change
    create_table :datasets do |t|
      t.string :movie
      t.string :type
      t.string :word
      t.string :minutes_in

      t.timestamps
    end
  end
end
