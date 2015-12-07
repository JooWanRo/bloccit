class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if !user.present?
        scope.where(:id => 0)
      elsif user.admin? || user.moderator?
        scope.all
      else
        scope.where(:user_id => user.id)
      end
    end
  end
end
