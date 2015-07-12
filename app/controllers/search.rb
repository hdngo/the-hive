post '/search' do
	@search_request = params[:search_request]
	redirect "/search/results_for/#{@search_request}"
end

get '/search/results_for/:search_request' do
	@search_request = params[:search_request]
	@results = (search_usernames(@search_request) + search_firstns(@search_request) + search_lastns(@search_request) + search_emails(@search_request)).uniq
	erb :"search/results"
end