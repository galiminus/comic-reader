class ComicPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    user && record.user == user
  end

  def create?
    new?
  end

  def update?
    new?
  end
end
