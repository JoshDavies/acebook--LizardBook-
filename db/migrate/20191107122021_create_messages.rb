class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :conversation, index: true
      t.references :user, index: true
      t.boolean :read

      t.timestamps
    end
  end
end
