class CreateTagsAndTaggings < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.column :name, :string, :null => false
    end
    add_index :tags, :name, :unique => true

    create_table :taggings do |t|
      t.column :tag_id, :integer, :null => false
      t.column :taggable_id, :integer, :null => false
      t.column :taggable_type, :string, :null => false
      t.column :tagger_id, :integer
	  t.column :tagger_type, :string
      t.column :context, :string
      t.column :created_at, :datetime
      # t.column :position, :integer # Uncomment this if you need to use <tt>acts_as_list</tt>.
    end
    add_index :taggings, :tag_id
    add_index :taggings, [:taggable_id, :taggable_type, :context]
  end
end
