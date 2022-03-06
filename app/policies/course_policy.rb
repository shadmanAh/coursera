class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def edit?
    @user.has_role?(:admin) || @record.user_id == @user.id
  end

  def update?
    @user.has_role?(:admin) || @record.user_id == @user.id
  end

  def new?
    @user.has_role?:teacher 
  end

  def create?
    @user.has_role?:teacher 
  end

  def destroy?
    @user.has_role?(:admin) || @record.user_id == @user.id
  end
end
