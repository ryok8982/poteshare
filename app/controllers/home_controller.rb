class HomeController < ApplicationController
  def index
    if user_signed_in?
    @name = current_user.username
    else
      @name = "ゲスト"
    end
  end
end
