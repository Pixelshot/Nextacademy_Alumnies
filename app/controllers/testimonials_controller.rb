class TestimonialsController < ApplicationController
  before_action :set_testimonial, only: [:edit, :update, :destroy]

  def new
  end

  def create
    user = User.find(params[:user_id])
    user.testimonials.create(testimonial_params.merge(poster_id: current_user.id))
    redirect_to :back
  end

  def edit
    @testimonial
  end

  def update

    if @testimonial.update(testimonial_params)
      redirect_to user_path(@testimonial.user)
    else
      render :edit
    end
  end

  def destroy
    set_testimonial
    @testimonial.destroy
    redirect_to :back
  end

private
  def testimonial_params
    params.require(:testimonial).permit(:text)
  end

  def set_testimonial
    @testimonial = Testimonial.find(params[:id])
  end
end