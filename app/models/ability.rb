class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user
      can :read, :all
      can [:edit, :update], User, id: user.id
      can [:update, :destroy], Post, user_id: user.id
      can :create, Post
    else
      can :read, [User, Post]
      cannot [:create, :edit, :update], :all
    end
  end
end
