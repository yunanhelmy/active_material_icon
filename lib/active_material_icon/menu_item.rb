module ActiveAdmin
  class MenuItem

    attr_reader :icon
    
    def initialize(options = {})
      super() # MenuNode
      @icon           = "<i class='material-icons'>#{options[:icon] || "arrow_right" }</i>"
      @label          = options[:label]
      @dirty_id       = options[:id]           || options[:label]
      @url            = options[:url]          || '#'
      @priority       = options[:priority]     || 10
      @html_options   = options[:html_options] || {}
      @should_display = options[:if]           || proc { true }
      @parent         = options[:parent]

      yield(self) if block_given? # Builder style syntax
    end

  end
end