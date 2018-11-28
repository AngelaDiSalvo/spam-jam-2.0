Rails.application.routes.draw do
  # get 'victims/bam'
  # get 'welcome'
  # get 'pick_generator'
  # post 'pick_generator'
  # get 'spam_jam' #main form
  # post 'spam_jam' #create with params
  # get 'sent'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/new/1', to: 'spam_emails#new1'
  get '/new/2', to: 'spam_emails#dog'
  post '/new/2', to: 'spam_emails#new'
  get '/bam', to: 'spam_emails#bam'
  get '/', to: 'spam_emails#welcome'
  get '/confirm', to: 'spam_emails#confirm'

  resources :spam_emails, only: [:index, :show, :new, :create]
  # resources :fake_emails, only: [:index, :show]
  resources :spam_types, only: [:index, :show]
  #resources :users, only: [:index, :show]
  # resources :victims, only: [:index, :show]

end
