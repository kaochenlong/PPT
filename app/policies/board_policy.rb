class BoardPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    plan_a_user || plan_b_user || admin
  end
end