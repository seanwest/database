ActionController::Routing::Routes.draw do 
  match 'database' => 'database#all'
  match 'database/:model' => 'database#index'
  match 'database/:model/:id' => 'database#show'
end
