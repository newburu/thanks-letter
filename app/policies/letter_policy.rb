class LetterPolicy < ApplicationPolicy

  def update?
    record.try(:user) == user
  end

  def edit?
    update?
  end

  def destroy?
    record.try(:user) == user
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
