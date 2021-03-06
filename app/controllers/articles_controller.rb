class ArticlesController < ApplicationController
	include ArticlesHelper

	before_action :require_login, except: [:index, :show]

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])

		@comment = Comment.new
		@comment.article_id = @article.id
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.author = current_user
		@article.save

		ArticleMailer.new_article(@article).deliver_later

		flash.notice = "Article #{@article.title} Created!"
		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		flash.notice = "Article #{@article.title} Deleted!"

		redirect_to articles_path
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "Article #{@article.title} Updated!"

		redirect_to article_path(@article)
	end

	def archive
		@article = Article.find(params[:id])
		if @article.status == "draft"
			@article.update(status: "archived")
			ArchiveMailer.article_archived(@article).deliver_later
		elsif @article.status == "archived"
			@article.update(status: "draft")
		end

		redirect_to @article, notice: "Status changed to #{@article.status}"
	end
end
