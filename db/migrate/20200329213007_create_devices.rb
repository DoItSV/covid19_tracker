class CreateDevices < ActiveRecord::Migration[6.0]
  def change
    create_table :devices, id: :uuid do |t|
      t.string :family, default: ''
      t.string :name, default: ''
      t.string :os, default: ''
      t.string :local_id
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
