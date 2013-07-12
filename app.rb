require './idea'

class IdeaBoxApp < Sinatra::Base

	set :method_override, true
	configure :developement do
	register Sinatra::Reloader
	end

  	
  	get '/' do
    	erb :index, locals: {ideas: Idea.all}
  	end

  	not_found do
  		erb :error
	end 

	post '/' do
		idea = Idea.new(params['idea_title'], params['idea_description'])
		idea.save
		redirect '/'
	end
  		
	post '/' do
		params.inspect
	end

	delete '/:index' do |index|
		Idea.delete(index.to_i)
		redirect '/'
  		
	end

	
end



