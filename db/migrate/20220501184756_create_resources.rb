class CreateResources < ActiveRecord::Migration[7.0]
  def change
    create_table :resources do |t|
      t.belongs_to :user
      t.string :secret
      t.timestamps
    end
  end
end
