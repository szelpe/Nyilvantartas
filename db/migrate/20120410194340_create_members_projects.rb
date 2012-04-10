class CreateMembersProjects < ActiveRecord::Migration
  def change
    create_table :members_projects, :id => false do |t|
      t.integer :member_id
      t.integer :project_id
    end
    add_index :members_projects, [ :member_id, :project_id ], :unique => true
  end
end
