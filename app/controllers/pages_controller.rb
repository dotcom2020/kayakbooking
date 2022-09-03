class PagesController < ApplicationController
  def dashboard
    @user = current_user
    @user_kayaks = Kayak.where(user_id: @user.id)
  end
end
