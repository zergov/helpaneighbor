class SpecialCondition
  CONDITIONS = [
    {
      name: "reduced_mobility",
      label: "Reduced mobility",
      icon: "map-icon map-icon-wheelchair"
    },
    {
      name: "low_vision",
      label: "Vision problems",
      icon: "map-icon map-icon-low-vision-access"
    },
    {
      name: "earing_problem",
      label: "Earing problem",
      icon: "map-icon map-icon-sign-language"
    }
  ]

  class << self
    def default_conditions
      CONDITIONS.map {|condition| new(condition)}
    end
  end

  attr_reader :name, :label, :icon
  def initialize(name:, label:, icon:)
    @name = name
    @label = label
    @icon = icon
  end
end
