class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    phrase = Phrase.find(params[:phrase_id])
    current_user.like(phrase)
    flash[:success] = 'いいね！しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    phrase = Phrase.find(params[:phrase_id])
    current_user.unlike(phrase)
    flash[:success] = 'いいねを解除しました。'
    redirect_back(fallback_location: root_path)
  end
end
