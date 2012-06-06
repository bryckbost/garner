class ContentController < ApplicationController
  def home
    if current_user
      redirect_to plants_path
    else
      redirect_to new_session_path
    end
  end
end
