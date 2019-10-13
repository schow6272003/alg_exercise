Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  concern :user_base  do 
    resources :users
  end
  
  concern :photo_base do
    resources  :photos 
    get  "time_lines" => "photos#time_lines" , as: :get_time_lines
  end 

  concern :favorite_base do
    resources :favorites
  end 
  
  concern :connection_base do
    resources :connections
  end

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      concerns :user_base
      concerns :photo_base
      concerns :favorite_base
      concerns :connection_base
    end 
  end
end
