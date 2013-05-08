require 'sinatra'
require 'erubis'

require_relative '../../models/init'

class Admin < Sinatra::Application



	get '/news/?' do 
		@news = Article.all
		erb :'news/index'
	end

	get '/news/new/?' do 
		@article = Article.new
		erb :'news/new'
	end

	post '/news' do 
		content_type :html
		@article = Article.new(params[:article])
		if @article.save
			redirect '/news'
		else
			flash[:error] = @article.errors.full_messages.join(",")
			redirect 'news/new'
		end
	end

	get '/news/:id' do
		@article = Article.get!(id)
		erb :'news/show'
	end

	delete '/news/:id' do 
		article = Article.get!(id)
		article.destroy!
		redirect '/news'
	end

	get '/news/:id/edit' do
		@article = Article.get!(id)
		erb :'news/edit'
	end

	put 'news/update' do
		@article = Article.get!(id)

		if @article.update!(params[:article])
			redirect 'news/#{id}'
		else
			redirect 'news/#{id}/edit'
		end
	end

end
