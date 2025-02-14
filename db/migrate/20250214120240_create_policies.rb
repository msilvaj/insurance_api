class CreatePolicies < ActiveRecord::Migration[7.2]
  def change
    create_table :policies do |t|
      t.string :policy_number
      t.references :client, null: false, foreign_key: true
      t.string :coverage_type

      t.timestamps
    end
  end
end
