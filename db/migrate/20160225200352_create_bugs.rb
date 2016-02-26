class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
      t.string :title
      t.text :description
      t.integer :issuetype, default:0
      t.integer :priority, default:0
      t.integer :status, default:0

      t.timestamps null: false
    end
  end
end
