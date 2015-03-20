class AdminController < ApplicationController
  def index
     # @users = User.includes(:line_items).where("line_items.id='61'")
     @users = User.all
  end
end
