Rails.application.routes.draw do
  namespace :admin do
    root to: redirect('/admin/subjects')
    resources :subjects, except: [:new, :create, :destroy]
  end

  get '/:slug(/*answers)' => 'subjects#show', as: 'subject'
end
