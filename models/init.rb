require 'data_mapper'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/dev.db")

require_relative 'article'

DataMapper.finalize.auto_upgrade!