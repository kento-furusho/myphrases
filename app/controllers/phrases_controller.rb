class PhrasesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @phrase = current_user.phrases.build(phrases_params)
    if @phrase.save
      flash[:success] = '新たなイチオシリリックを投稿しました。'
      redirect_to root_url
    else
      @phrase = current_user.phrases.order(id: :desc).page(params[:page])
      flash.now[:danger] = '投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @phrase.destroy
    flash[:success] = '投稿を削除しました。'
    redirect_back(fallback_location: root_path)
  end

  def edit
  end
  
  private
  
  def phrases_params
    params.require(:phrase).permit(:singer, :title, :lyric, :comment)
  end
  
  def correct_user
    @phrase = current_user.phrases.find_by(id: params[:id])
    unless @phrase
      redirect_to root_url
    end
  end
end
