class CreateTranslations < ActiveRecord::Migration
  def self.up
    create_table :translations do |t|
      t.text :text
      t.string :language, :limit => 10
      t.boolean :recommended
      t.string :partofspeech, :limit => 25
      t.string :grammaticalgender, :limit => 25
      t.string :grammaticalnumber, :limit => 25
      t.integer :concept_id
      t.timestamps
    end
  end

  def self.down
    drop_table :translations
  end
end
