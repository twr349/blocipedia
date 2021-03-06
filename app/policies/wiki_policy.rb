class WikiPolicy < ApplicationPolicy

    attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    user.present?
  end

  def edit?
    update?
  end

  def destroy?
    user.Admin?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end
  
  class Scope
     attr_reader :user, :scope
 
     def initialize(user, scope)
       @user = user
       @scope = scope
     end
 
     def resolve
       wikis = []
       if user.role == 'Admin'
         wikis = scope.all # if the user is an admin, show them all the wikis
       elsif user.role == 'Premium'
         all_wikis = scope.all
         all_wikis.each do |wiki|
           if wiki.private = true || wiki.owner == user || wiki.collaborators.pluck(:user_id).include?(user.id)
             wikis << wiki # if the user is premium, only show them public wikis, or that private wikis they created, or private wikis they are a collaborator on
           end
         end
       else # this is the lowly standard user
         all_wikis = scope.all
         wikis = []
         all_wikis.each do |wiki|
           if wiki.private == false || wiki.collaborators.pluck(:user_id).include?(user.id)
             wikis << wiki # only show standard users public wikis and private wikis they are a collaborator on
           end
         end
       end
       wikis # return the wikis array we've built up
     end
   end
end