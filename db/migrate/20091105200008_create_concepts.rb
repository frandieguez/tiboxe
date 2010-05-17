class CreateConcepts < ActiveRecord::Migration
  def self.up
    create_table :concepts do |t|
      t.string :scope, :limit => 255
      t.text :definition
      t.text :example
      t.string :glossary_name, :limit => 255
      t.boolean :is_free, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :concepts
  end
end
