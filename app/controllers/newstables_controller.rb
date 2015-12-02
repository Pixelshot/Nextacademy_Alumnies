class NewstablesController < ApplicationController

	def index
		@newstable = Newstable.all
	end

	def new
	end

	def create
		@newstable = current_user.newstables.new(newstable_params)
		if @newstable.save
			redirect_to newstables_path
			flash[:Notice] = "Newsfeed successfully created"
		else
			render :new
			flash[:Warning] = "Newsfeed not created"
		end
	end

	def show 
		set_newstable
	end

	def edit
		set_newstable
	end

	def destroy
		set_newstable
		@newstables.destroy
		redirect_to newstables_path
	end




	private
    def newstable_params
      params.require(:newstable).permit(:title, :body, images: [])
    end

    def set_newstable
      @newstables = Newstable.find(params[:id])
    end

end