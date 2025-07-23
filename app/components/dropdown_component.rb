class DropdownComponent < ViewComponent::Base
  include Turbo::FramesHelper

  def initialize(form:, name:, **rest)
    super
    @form = form
    @name = name
    @rest = rest
  end
end
