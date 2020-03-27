module ApplicationHelper
  def special_conditions
    SpecialCondition.default_conditions
  end
end
