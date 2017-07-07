class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.is_admin?
      can :create, User
      can [:update, :destroy], User, id: use.id
      can [:destroy], Post
    else
      can :update, User, id: user.id
      can [:update, :destroy], Post, user_id: user.id
    end
  end
end
