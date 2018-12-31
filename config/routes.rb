Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :restaurants, except: [:show]

      post 'restaurants/list', to: 'restaurants#list'
    end
  end
end
