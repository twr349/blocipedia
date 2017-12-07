class Wiki < ApplicationRecord
  belongs_to :user
  has_many :wiki_collaborators, dependent: :destroy
  has_many :collaborators, through: :wiki_collaborators, class_name: 'User'
    
  
  default_scope { order('created_at DESC') }
  
end
