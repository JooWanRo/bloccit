class SummariesController < ApplicationController
  def index
    @summaries = Summary.all
    authorize @summaries
  end

  def new
    @summary = Summary.new
    authorize @summary
  end

  def show
    @summary = Summary.find(params[:id])
    @post = @summary.post
    @topic = @post.topic
    authorize @summary
  end

  def edit
    @summary = Summary.find(params[:id])
    authorize @summary
  end

  def create
    @summary = Summary.new(params.require(:summary).permit(:title, :description, :post_id))
    post_id = params[:summary][:post_id].to_i
    authorize @summary
    # If the post is already associated with a summary, then error!
    if !Post.find(post_id).summary && @summary.save
      redirect_to @summary, notice: "Summary was saved successfully."
    else
      flash[:error] = "Error creating summary. Please try again."
      render :new
    end
  end

  def update
    @summary = Summary.find(params[:id])
    authorize @summary
    if @summary.update_attributes(params.require(:summary).permit(:title, :description))
      redirect_to @summary
    else
      flash[:error] = "Error saving summary. Please try again."
      render :edit
    end
  end
end
