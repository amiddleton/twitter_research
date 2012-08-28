class CategoriesController < ApplicationController

  def index
    @categories = Category.order(:title).limit(50)
    respond_with(@categories)
  end

  def show
    @category = Category.includes(:tweets).
      order('tweets.tweeted_at desc').find(params[:id])
    respond_with(@category)
  end

  def new
    @category = Category.new
    respond_with(@category) do |format|
      format.js {render(partial: 'form', content_type: "text/html")}
    end
  end

  def create
    @category = Category.create(params[:category])
    respond_with(@category, location: categories_url) do |format|
      format.js {render(partial: 'category',
          object: @category, content_type: "text/html")}
    end
  end

  def edit
    @category = Category.find(params[:id])
    respond_with(@category)
  end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes(params[:category])
    respond_with(@category, location: categories_url)
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    respond_with(@category) do |format|
      format.js {render(:nothing => true)}
    end
  end
end
