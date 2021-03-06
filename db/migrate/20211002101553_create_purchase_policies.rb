class CreatePurchasePolicies < SolidusSupport::Migration[6.1]
  def change
    create_table  :spree_purchase_policies do |t|

      t.integer      :user_id
      t.integer      :purchase_policy_type_id
      t.text         :title, limit: 50
      t.text         :content
      t.boolean      :approved, default: false

      t.timestamps
    end
  end
end
