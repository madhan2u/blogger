class ArticlesController < ApplicationController
  include ArticlesHelper
  before_action :require_login, except: [ :index, :show ]
  
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end
  
  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
  end
  
  def create
    @article = Article.new(article_params)
    @article.save
    flash.notice = "Article #{@article.title} is Created"
    redirect_to article_path(@article)
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
  if article_params.present?
      @article = Article.find(params[:id])
      @article.update_attributes(article_params)
      flash.notice = "Article #{@article.title} is Updated"
    redirect_to article_path(@article)
  else
    redirect_to articles_path
  end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash.notice = "Article #{@article.title} is Deleted"
    redirect_to articles_path
  end
end
