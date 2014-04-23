Rails.application.routes.draw do
  get '/:slug(/*answers)' => 'subjects#show', as: 'subject'
end
