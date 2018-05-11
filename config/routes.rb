Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#index'
  post 'upload_data' => "uploaders#upload_data", as: :upload_data
  get 'upload_csv' => "uploaders#upload_csv", as: :upload_csv
end
