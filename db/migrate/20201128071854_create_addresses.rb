class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postcode,    default: "",  null: false
      t.integer :prefecture_id,                  null: false
      t.string :city,           default: "",  null: false
      t.string :block,   default: "",  null: false
      t.string :building,  default: ""
      t.string :tell,  default: "",  null: false
      t.references :user,                     null: false,  foreign_key: true
      t.timestamps
    end
  end
end
