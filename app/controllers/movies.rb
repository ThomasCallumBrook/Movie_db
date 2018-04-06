MovieDb::App.controllers :movies do
  get :index, :map => '/' do
    @movies = Movie.order(rating: :desc).limit(5)
    output = "Top Five Movies<br>"
    @movies.each do |movie|
      output += "#{movie.title}<br>"
    end
    output
    render 'index'
  end

  get :index, :with => :id do
    @movie = Movie.find(params[:id])
    @title = @movie.title
    @genres = @movie.genres 
    render 'movie'

  end



  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   "Maps to url '/foo/#{params[:id]}'"
  # end

  # get '/example' do
  #   'Hello world!'
  # end


end
