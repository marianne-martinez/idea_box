require './idea'

class IdeaBoxApp < Sinatra::Base

	set :method_override, true
	configure :developement do
	register Sinatra::Reloader
	end

  	
  	get '/' do
    	erb :index, locals: {ideas: Idea.all}
  	end

  	get '/:id/edit' do |id|
  		idea = Idea.find(id.to_i)
  		erb :edit, locals: {id: id, idea: idea}
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

	put 'i/:id' do |id|
		"Tweaking the IDEA!"
	end

	put '/:id' do |id|
  		data = {
    		:title => params['idea_title'],
    		:description => params['idea_description']
    	}
  		Idea.update(id.to_i, data)
  		redirect '/'
	end

end



