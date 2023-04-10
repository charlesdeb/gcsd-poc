# frozen_string_literal: true

# This was replaced with a partial (user/_avatar.html.erb) to save using
# decorators. However, I'm not convinced yet that decorators are a bad
# way to enhance objects for the view layer, so this code remains - for now...

class UserDecorator # this line is bogus - if you want to use this decorator
  # use the following line and install the draper gem. This line is in place
  # so that Zeitwerk is happy and that we don't have an unused gem in the proj
  # class UserDecorator < Draper::Decorator
  #   delegate_all
  #   # Define presentation-specific methods here. Helpers are accessed through
  #   # `helpers` (aka `h`). You can override attributes, for example:
  #   #
  #   #   def created_at
  #   #     helpers.content_tag :span, class: 'time' do
  #   #       object.created_at.strftime("%a %m/%d/%y")
  #   #     end
  #   #   end

  #   def avatar
  #     if profile_image.attached?
  #       h.image_tag(profile_image.variant(:thumb), class: 'h-8 w-8 rounded-full')
  #     else
  #       initials
  #     end
  #   end

  #   def initials
  #     h.tag.div(object.initials,
  #               class: 'text-gray-500 hover:text-gray-700 bg-transparent p-1 border-orange border-2 rounded-full')
  #   end
end
