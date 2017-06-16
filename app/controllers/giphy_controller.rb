post '/giphys' do
  giphys = Giphy.get_giphy(params[:giphy][:search_term])
  @parsed_giphys = Giphy.parse_giphy(giphys)
   
  if request.xhr?
  	erb :"/giphys/show", layout: false
  else
   erb :"/giphys/show"
 	end
   
end