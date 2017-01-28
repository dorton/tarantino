class ProfaneWord

  def initialize(movie)
    @movie = movie
  end

  def all_words
    all_words = @movie.datasets.all.map { |a| a.profane_word  }
  end

  def the_words
    unique_words_array = all_words.uniq
  end



  def word_counts
    the_words.each do |word|
      all_words.select {|a| a == word }.count
    end
  end

end
