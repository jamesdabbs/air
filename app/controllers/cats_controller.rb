class CatsController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def serve
    cat = current_user.cat_me!
    redirect_to :back
  end
end
