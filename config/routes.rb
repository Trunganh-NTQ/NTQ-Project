Rails.application.routes.draw do

  get 'home/content'
  get "content/edit" => 'content#edit', :as => :edit

  get  '/set-captain',   to: 'roles#setCaptain',      as: "set_captain"
  get  '/set-mentor',    to: 'roles#setMentor' ,      as: "set_mentor"

  get  '/delete-mentor', to: 'roles#destroyMentor',   as: "del_mentor"
  get  '/delete-member', to: 'roles#destroyMember',   as: "del_member"

  get  '/join-group',    to: 'join_groups#joinGroup', as: "join_group"
  get  '/leave-group',    to: 'join_groups#leaveGroup', as: "leave_group"

  get  '/approve-content',    to: 'pendings#approveContent', as: "approve_content"
  get  '/decline-content',    to: 'pendings#declineContent', as: "decline_content"

  get  '/approve-member',    to: 'pendings#approveMember', as: "approve_member"
  get  '/decline-member',    to: 'pendings#declineMember', as: "decline_member"


  root 'home#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  mount Ckeditor::Engine => '/ckeditor'

  resources :users
  resources :attendances
  resources :groups do
    resources :contents, except: [:show, :index]
    resources :members

    resources :pendings
    resources :settings

  end
  resources :courses
  resources :details
end
