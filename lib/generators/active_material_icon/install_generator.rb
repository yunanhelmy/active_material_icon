module ActiveMaterialIcon
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../../templates", __FILE__)

    def inject_css_code
      insert_into_file "app/assets/stylesheets/active_admin.scss", after: '@import "active_material";' do
      "
      
.header-item.tabs li a {
  display: flex;
  align-items: center;
}
      
      "
      end
    end

    def inject_utility_nav
      insert_into_file "config/initializers/active_admin.rb", before: "# == Menu System" do
      "

  config.register_stylesheet 'https://fonts.googleapis.com/icon?family=Material+Icons'

  config.namespace :admin do |admin|
    admin.build_menu :utility_navigation do |menu|
      menu.add id: 'current_user', priority: 1, html_options: {},
        icon: 'account_circle',
        label: -> { display_name current_active_admin_user },
        url:   -> { auto_url_for(current_active_admin_user) },
        if:    :current_active_admin_user?
      
      menu.add id: 'logout', priority: 2, html_options: {method: (config.logout_link_method || :get)},
        icon: 'logout',
        label: -> { I18n.t 'active_admin.logout' },
        url:   -> { render_or_call_method_or_proc_on self, active_admin_namespace.logout_link_path },
        if:    :current_active_admin_user?
    end
  end

      "
      end
    end

  end
end