class BoardPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    if plan_a_user
      user.boards.count < 2
    elsif (plan_b_user || admin)
      true
    else
      false
    end
  end
end