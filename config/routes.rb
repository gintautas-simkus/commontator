Commontator::Engine.routes.draw do
  resources :threads, :only => [:show] do
    resources :comments, :except => [:index, :destroy], :shallow => true do
      put 'delete', :on => :member
      put 'undelete', :on => :member
      
      put 'upvote', :on => :member
      put 'downvote', :on => :member
      put 'unvote', :on => :member
    end
    
    put 'close', :on => :member
    put 'reopen', :on => :member
    
    put 'subscribe', :to => 'subscriptions#create',
                     :as => 'subscribe',
                     :on => :member
    put 'unsubscribe', :to => 'subscriptions#destroy',
                       :as => 'unsubscribe',
                       :on => :member
  end
end
