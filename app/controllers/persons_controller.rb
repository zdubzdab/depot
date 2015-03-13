class PersonsController < ApplicationController
  
  def profile
    @products = current_user.products.order("created_at DESC")
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :id, :password)
    end
end
