get '/' do
  erb :index
  # let user create new short URL, display a list of shortened URLs
end

post '/urls' do
  
  @url = Url.new(url: params[:url])
    if @url.save
    session[:success] = "Shortening Your URL!"
    redirect to ("/url_list")
  else#redirect back to the form page and show the errors
    @errors = url.errors.full_messages
    erb :index
  end
end

get "/url_list" do
  @success = session.delete(:success) if session[:success]
  @urls = Url.all
  erb :short_url  # redirect to appropriate "
end 

# # e.g., /q6bda
get '/:short_url' do
  

  url_clicked = Url.find_by_short_url(params[:short_url])
  url_clicked.count += 1
  url_clicked.save

  redirect(url_clicked.url)
end
