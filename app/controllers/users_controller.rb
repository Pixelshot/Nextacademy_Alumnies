class UsersController < ApplicationController

	def index

	end

	def show
	end

	def edit
		@user = User.update(user_params)
	end

	def update
		if @blog.update(blog_params)
      redirect_to @blog
    else
      render :edit
    end
	end

	def destroy
    @blog.destroy
    redirect_to blogs_path
  end

  private 
	def user_params
    params.require(:user).permit(:party_name, :location, :price, :description, :theme, :date, :time, :listing_id, :picture)
  end
end