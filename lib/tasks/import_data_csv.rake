require 'csv'
namespace :import_data_csv do
  desc "I Import All The Data"
  task :create_data => :environment do
    CSV.foreach("#{Rails.root}/public/tarantino.csv", :headers => true) do |row|
      Dataset.create!(row.to_hash)
    end
    movies = Dataset.all.map{|a| a.movie_name}.uniq
    movies.each do |movie|
      Movie.create!(name: movie)
    end
    Movie.all.each do |movie|
      Dataset.where(movie_name: movie.name).each do |update|
        update.update_attributes(movie_id: movie.id)
      end
    end
    movie_name_array = Movie.all.map { |a| a.name }
    time = [100, 178, 112, 138, 153, 165, 160]
    movie_times = movie_name_array.zip(time)
    movie_times.each do |movie_array|
      Movie.find_by(name: movie_array[0]).update_attributes(minutes: movie_array[1])
    end
  end
end
