class Ability
  include CanCan::Ability

  def initialize(user)
    if user & admin?
      can :manage, :all
    else
      can %i[read create], :all
      can %i[update destroy], Food, user_id: user.id
      can %i[update destroy], Recipe, user_id: user.id

    end
  end
end
