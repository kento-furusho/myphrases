class ToppagesController < ApplicationController
  def index
    if logged_in?
      # form_with用？？
      @phrase = current_user.phrases.build
      @phrases = current_user.feed_phrases.order(id: :desc).page(params[:page])
    end   
  end
end
