class CompanyPolicy
  attr_reader :member, :record

  def initialize(member, record)
    @member = member
    @record = record
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    [:admin, :editor].any? { |role| member.has_role? role }
    # member.has_role? (:admin) || member.has_role? (:editor)
  end

  def new?
    create?
  end

  def update?
    edit?
  end

  def edit?
    [:admin, :editor].any? { |role| member.has_role? role }
  end

  def destroy?
    false
  end

  class Scope
    attr_reader :user, :scope

    def initialize(member, scope)
      @member = member
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
