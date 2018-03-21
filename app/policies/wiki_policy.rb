class WikiPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def new?
    user.present?
  end
  
  def update?
    record.private ? (user.admin? || (record.user == user)) : user.present?
  end
  
  def edit?
    record.private ? (user.admin? || (record.user == user)) : user.present?
  end
  
  def destroy?
    user.present? && user.admin?
  end
end