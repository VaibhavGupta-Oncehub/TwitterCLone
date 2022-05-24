class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:help_desk]
  def home
  end

  def help_desk
  end

end
