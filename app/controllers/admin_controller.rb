class AdminController < ApplicationController
  def index
     # @users = User.preload(:line_items).where("users.name='eee'")
     @users = User.all
  end
end
