class CommentController < ApplicationController
  before_action :set_location

  def new
    @comment = Comment.new
  end

  def create
    @comment = @location.comments.new(comment_params)
    if @comment.save
      redirect_to gym_location_path(@location.gym_id, @location)
    else
      render :new
    end
  end

  private
    def set_location
      @location = Location.find(params[:location_id])
    end

    def comment_params
      params.require(:comment).permit(:body, :author)
    end
end

