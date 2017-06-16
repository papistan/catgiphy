post '/giphy' do
 
  p params[:giphy][:search_term]
   giphys = Giphy.get_giphy(params[:giphy][:search_term])
   @parsed_giphys = Giphy.parse_giphy(giphys)
   erb :"/giphys/show"
   
end