get '/' do
  erb :index
end

post '/urls' do
  @url = Url.create(long_url: params[:url], counter: 0)
  if @url.errors.any?
    erb :error_url
  end
  erb :short_url
end

# e.g., /q6bda
get '/:short_url' do
  url = Url.find_by_short_url(params[:short_url])

  redirect url.long_url
end
