class CreateCatRequests < ActiveRecord::Migration
  def change
    create_table :cat_requests do |t|
      t.integer :user_id
      t.integer :cat_id

      t.timestamps
    end
  end
end
