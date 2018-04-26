class WelcomeController < ApplicationController

  # Root
  def index
    render :layout => 'welcome'
  end

  def show
    render :layout => 'application'
    @tip = current_user.tips.first
  end
end
