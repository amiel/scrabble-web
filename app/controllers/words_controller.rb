class WordsController < ApplicationController
  def index
    @new_word = Word.new
    @previous_words = Word.all
    @last_word = Word.last
  end

  def create
    Word.create params[:word]
    redirect_to words_path
  end
end
