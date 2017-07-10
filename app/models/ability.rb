class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    can :read, :all
    if user
      can [:edit, :update], User, id: user.id
      can [:update, :destroy], Post, user_id: user.id
      can :create, Post
    else
      can :read, [User, Post]
      cannot [:create, :edit, :update], :all
    end
    if user.is_admin?
      can :manage, Post
      can :destroy, User
      can :destroy, Comment
    end
  end
end
