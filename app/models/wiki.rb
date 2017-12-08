class Wiki < ApplicationRecord
  belongs_to :user
  has_many :wiki_collaborators,  dependent: :destroy
  has_many :collaborators, through: :wiki_collaborators
    
  
  default_scope { order('created_at DESC') }
  
  
  
end
