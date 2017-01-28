class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all
    @word_objects = Dataset.where("profane_word is NOT ?", nil)
    @word_array = Dataset.where("profane_word is NOT ?", nil).map { |e| e.profane_word  }
    @unique_words = @word_array.uniq
    @word_instances_count = @word_objects.count
    @freq = @word_array.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    @most_frequent_word = @word_array.max_by { |v| @freq[v] }
    @top_five = @freq.sort_by { |k,v| v }.reverse.first(5)
    @fbombs = @word_array.select {|a| /fuck/ =~ a }
    @fbombfreq = @fbombs.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    @sorted_fbombs = @fbombfreq.sort_by { |k,v| v }.reverse
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @profane_words = ProfaneWord.new(@movie).the_words
    @all_words = ProfaneWord.new(@movie).all_words.compact
    @total = @movie.datasets.where('profane_word is NOT ?', nil).count
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:name, :minutes)
    end
end
