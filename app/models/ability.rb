class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new #guest user (not logged in)

    if user.present?  # additional permissions for logged in users
      can [:create, :destroy], Comment, user_id: user.id
      can [:show, :create, :update, :destroy], User, id: user.id #can manage own user, but can NOT index all users
      can :manage, Order, user_id: user.id
      can :read, Product # permissions for every user, even if not logged in
      cannot [:edit, :new, :create, :destroy, :update ]
    if user.admin?  # additional permissions for administrators
        can :manage, :all
    end
    end
  end

end
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
#  end
#end
