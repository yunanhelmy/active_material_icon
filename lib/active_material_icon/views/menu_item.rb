module ActiveAdmin
  module Views

    class MenuItem < Component
      
      def build(item, options = {})
        super(options.merge(id: item.id))
        @label = [item.icon, "&nbsp;&nbsp;"].join(" ").html_safe + (helpers.render_in_context self, item.label)
        @url = helpers.render_in_context self, item.url
        @priority = item.priority
        @submenu = nil

        add_class "current" if item.current? assigns[:current_tab]

        if url
          text_node link_to label, url, item.html_options
        else
          span label, item.html_options
        end

        if item.items.any?
          add_class "has_nested"
          @submenu = menu(item)
        end
      end

    end
  end
end