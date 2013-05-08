require 'data_mapper'

class Article
	include DataMapper::Resource

	before :save, :append_div_tag

	property :id, Serial
	property :title, String, required: true
	property :content, Text, required: true
	property :created_at, DateTime

	def date_format
		@created_at.strftime "%d.%m.%Y"
	end

	def append_div_tag
		@content.insert(0, '<div>').insert(-1, '</div>')
	end

end
