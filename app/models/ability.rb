class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

      if user.super_admin?
        can :manage, :all
      else
        can :manage, Category
        can :manage, ContextItem
        can :manage, PersonalInformationItem
        can :manage, Rule
        can :manage, UseItem

        can :manage, User, id: user.id
        can :read, User
        cannot [:new, :create], User
      end
  end
end
