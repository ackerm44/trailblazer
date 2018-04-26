class WelcomeController < ApplicationController
  # Root
  def index
    
  end

  def show
    @tip = current_user.tips.first
  end
end
