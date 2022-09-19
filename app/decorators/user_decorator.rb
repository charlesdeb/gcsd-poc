# frozen_string_literal: true

class UserDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def avatar
    if profile_image.attached?
      h.image_tag(profile_image.variant(:thumb), class: 'h-8 w-8 rounded-full')
    else
      initials
    end
  end

  def initials
    h.tag.div(object.initials,
              class: 'text-gray-500 hover:text-gray-700 bg-transparent p-1 border-orange border-2 rounded-full')
  end
end
