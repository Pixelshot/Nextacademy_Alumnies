class NewstablesController < ApplicationController
before_action :set_newstable, only: [:show, :edit, :update, :destroy]

	def index
		@newstable = Newstable.all
	end

	def new
	end

	def create
		@newstable = current_user.newstables.new(newstable_params)
		if @newstable.save
			# NotifyMailer.news_email(@newstable).deliver_now
			NewsJob.perform_later(@newstable.id)
			redirect_to newstables_path
			flash[:Notice] = "Newsfeed successfully created"
		else
			render :new
			flash[:Warning] = "Newsfeed not created"
		end
	end

	def show 
	end

	def edit
	end

	def update
		if @newstables.update(newstable_params)
			redirect_to @newstables
		else
			render :edit
		end
	end

	def destroy
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