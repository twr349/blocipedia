class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable
         
    has_many :wikis, dependent: :destroy
    has_many :wiki_collaborators, dependent: :destroy
    has_many :wiki_collaborators, through: :wiki_collaborators 
    
    before_create :set_default_role
    
    def set_default_role
      self.role ||= :Standard 
    end
  
  enum role: [:Standard, :Premium, :Admin]
end
