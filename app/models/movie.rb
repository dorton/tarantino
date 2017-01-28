class Movie < ApplicationRecord
  has_many :datasets

    def self.density_arr
      word_arr = []
      ratio_arr = []
      Movie.all.each do |movie|
        word_arr << movie.name
        ratio_arr << movie.datasets.where(event: 'word').count/movie.minutes.to_f
      end

      ratios = word_arr.zip(ratio_arr).sort_by {|m, r| r}.reverse

    end


end
