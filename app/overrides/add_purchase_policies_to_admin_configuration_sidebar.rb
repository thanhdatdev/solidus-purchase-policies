# frozen_string_literal: true

Spree::Backend::Config.configure do |config|
  config.menu_items.detect { |menu_item|
    menu_item.label == :settings
  }.sections << :purchase_policy_settings
end

Deface::Override.new(
  virtual_path: "spree/admin/shared/_settings_sub_menu",
  name: "converted_admin_configurations_menu",
  insert_bottom: "[data-hook='admin_settings_sub_tabs']",
  disabled: false
) do
  <<-HTML
    <% if can? :admin, Spree::PurchasePoliciesConfiguration %>
      <%= tab :purchase_policies, url: spree.edit_admin_purchase_policy_settings_path, match_path: /purchase_policy_settings/ %>
    <% end %>
  HTML
end
