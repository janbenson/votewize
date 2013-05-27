Demo::Application.routes.draw do
 	resource :demo
	resources :categories 
        resource :questions
	resource :answers
	resources :users do 
	  member do
             get :following, :followers
          end
        end
        resources :microposts
        resources :profiles
	resources :sessions
	
    

    
      
 match '/contact', :to => 'pages#contact'
    match '/about',   :to => 'pages#about'
    match '/help',    :to => 'pages#help'
    match '/signup',  :to => 'users#new'
    match '/signin',  :to => 'sessions#new'

    match 'sessions/:id/shownewuser',  :to => 'sessions#shownewuser' , :as => :shownewuser
    match 'sessions/:id/signedin',  :to => 'sessions#signedin' , :as => :signedin
    match 'profiles/setuserprofile',  :to => 'profiles#setuserprofile' , :as => :setuserprofile
    match 'sessions/:id/showsurvey', :to => 'sessions#showsurvey', :as => :showsurvey
    match 'sessions/:id/expressyourself', :to => 'sessions#expressyourself', :as => :expressyourself
    match 'sessions/:id/discuss', :to => 'sessions#discuss', :as => :discuss
    match 'sessions/:id/updateanswers', :to => 'sessions#updateanswers', :as => :updateanswers
    match 'sessions/:id/updateProfile', :to => 'sessions#updateProfile', :as => :updateProfile
    
    match '/signout', :to => 'sessions#destroy'
    root :to => 'sessions#signedin'
end