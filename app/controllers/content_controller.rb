class ContentController < ApplicationController
  def home
    if current_user
      redirect_to plants_path
    end
  end
end
