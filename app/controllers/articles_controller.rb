class ArticlesController < ApplicationController

  include ArticlesHelper

  def index
    @articles = Article.all
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def new
    @article = Article.new
  end

  def create
    # article_params is used as security, so that only allowed attributes are modified.
    # See app/helpers/articles_helper.rb
    @article = Article.new(article_params)
    @article.save
    flash.notice = "Article '#{@article.title}' Created!"
    redirect_to article_path(@article)
  end
  
  def edit
    @article = Article.find(params[:id])
  end

  def update # very similar to 'create' action
    @article = Article.find(params[:id])
    # update is similar to 'new', but automatically saves the changes
    @article.update(article_params)
    flash.notice = "Article '#{@article.title}' Updated!"
    redirect_to article_path(@article)
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash.notice = "Article '#{@article.title}' Deleted!"
    redirect_to articles_path
  end
end
