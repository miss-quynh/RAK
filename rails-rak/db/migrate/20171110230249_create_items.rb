class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :item_name
      t.blob :image
      t.references :donation_type
      t.timestamps
    end
  end
end
