class CreateScenes < ActiveRecord::Migration[7.0]
  def change
    create_table :scenes do |t|
      t.citext :title, null: false

      t.timestamps
    end

    add_index :scenes,
      :title,
      name: "index_scenes_title_unique",
      unique: true
  end
end
