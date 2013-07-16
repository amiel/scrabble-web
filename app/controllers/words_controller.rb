class WordsController < ApplicationController
  def index
    @new_word = Word.new
    @previous_words = Word.all
    @last_word = Word.last
  end

  def create
    @word = Word.new params[:word]
    if @word.save
      # Good on you
    else
      flash[:notice] = "Sorry, please enter at least one word made up of only letters"
    end

    redirect_to words_path
  end
end
