Rails.application.routes.draw do

  root 'links#index'
  post '/get_shortest_link', to: 'links#get_shortest_link'
  get '/:unique_code', to: 'links#redirect_to_original_link'

end
