require 'yaml/store'
class Idea
	def self.delete(position)
   	 database.transaction do
      	database['ideas'].delete_at(position)
    end
  end
	
	attr_reader :title, :description

	def self.all
  	database.transaction do
    	database['ideas']
  	end.map do |data|
    Idea.new(data[:title], data[:description])
  end
end

	def self.database
		@database ||= YAML::Store.new('ideabox')
	end 

	def initialize(title, description)
		@title = title
		@description = description
	end
	def save
		database.transaction do |db|
			db['ideas'] ||= []
			db['ideas'] << {title: title, description: description}
			
		end
	end

	def database
		@database ||= YAML::Store.new "ideabox"
		idea.database
	end



end