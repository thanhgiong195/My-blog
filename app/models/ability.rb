class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    can :read, :all
    if user.is_admin?
      can :create, User
      can :update, User, id: user.id
      can :delete, User, id: user.id
    else
      can :update, User, id: user.id
      can :delete, User, id: user.id
    end
  end
end
