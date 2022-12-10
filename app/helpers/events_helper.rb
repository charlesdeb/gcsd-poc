# frozen_string_literal: true

# Helper for Events model
module EventsHelper
  def session_type_tab(session_type, position)
    bg_color_class = position.zero? ? 'bg-orange-800' : 'bg-transparent'
    link_content = content_tag(:span, "#{session_type.name} (#{session_type.count})")
    link_content += content_tag(
      :span, '',
      class: "#{bg_color_class} bg-orange-800 absolute inset-x-0 bottom-0 h-0.5",
      'aria-hidden': true
    )

    color_class = position.zero? ? 'text-orange-900' : 'text-orange-500 hover:text-orange-700'

    link_to link_content, '#',
            class: "#{color_class} first:rounded-tl-lg last:rounded-tr-lg group relative min-w-0 flex-1 overflow-hidden bg-orange-50 py-4 px-4 text-sm font-medium text-center hover:bg-orange-200 focus:z-10"
  end
end
