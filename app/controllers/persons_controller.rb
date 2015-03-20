class PersonsController < ApplicationController
  
  def profile
    # @line_items = current_user.line_items.order("created_at DESC")
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :id, :password)
    end
end
