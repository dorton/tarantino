class AddMovieToDatasets < ActiveRecord::Migration[5.0]
  def change
    add_reference :datasets, :movie, foreign_key: true
  end
end
