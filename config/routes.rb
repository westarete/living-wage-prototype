Lwc::Application.routes.draw do

  root to: 'profile#show', :type => "State", :id => 999999

  match '/about' => 'static_pages#about'

  match '/contacts',     to: 'contacts#new',             via: 'get'
  resources "contacts", only: [:new, :create]

  resources :counties, :controller => "profile", :type => "County" do
    get :autocomplete_geography_name, :on => :collection
  end

  resources :metros, :controller => "profile", :type => "Metro" do
    get :autocomplete_geography_name, :on => :collection
  end

  resources :states, :controller => "profile", :type => "State" do
    get :autocomplete_geography_name, :on => :collection
  end

end
