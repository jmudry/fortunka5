class CommentsController < ApplicationController
  respond_to :html, :json

  before_filter do
    @fortune = Fortune.find(params[:fortune_id])
  end

  def create
    @comment = @fortune.comments.build(params[:comment])
    @comment.save
    respond_with(@fortune, @comment, :location => @fortune)
  end

  def destroy
    @comment = @fortune.comments.find(params[:id])
    @comment.destroy
     respond_with(@fortune, @comment, :location => @fortune)
  end

  def edit
    @comment = @fortune.comments.find(params[:id])
  end

  def update
    @comment = @fortune.comments.find(params[:id])
    @comment.update_attributes(params[:comment])
    respond_with(@fortune, @comment, :location => @fortune)
  end
end