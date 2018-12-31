Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :restaurants, except: [:show]

      post 'restaurants/list', to: 'restaurants#list'

      # Not worth using nested routes here, since it's an API
      resources :dishes, except: [:show]
    end
  end
end
