class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def show
	end
	def index
		@articles = Article.all
	end
	def new
		@article = Article.new
	end
  def edit
  end
	def create
		@article = Article.new(article_params)
		if @article.save
			redirect_to @article
		else 
			puts flash[:notice] = "Successfully created article."  
			render 'new', status: :unprocessable_entity 
		end
	end
  def update
    # Find the article that you want to edit
    if @article.update(article_params)
      flash[:notice] = 'Article was updated successfully'
      redirect_to @article
    else
      render 'edit'
    end
  end
  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private 
  # Anything below will be a private method
  def set_article
    # Get the article with a specific id from the database
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end