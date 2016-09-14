class Recipe
	include HTTParty
	@@hotsport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
	base_uri "http://#{@@hotsport}/api"
	default_params key: ENV['FOOD2FORK_KEY']
	format :json

	def self.for(search_term)
		get("/search",query: {q: search_term})["recipes"]
	end
end
