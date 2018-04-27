class GamesController < ApplicationController
  def new
    @grid = Array.new(15) { ("A".."Z").to_a.sample }
  end


  def score
    @attempt = params[:word]
    @word_split = @attempt.upcase.chars
    @token_grid = params[:token].chars
    reject_array = @word_split.reject { |l| @token_grid.include? l }
    if reject_array.empty?
      @results = "congratulations your word is #{@attempt}"
    else
      @results = "Sorry but #{@attempt} can't be built from #{@token_grid.join(", ")}"
    end
  end
end
