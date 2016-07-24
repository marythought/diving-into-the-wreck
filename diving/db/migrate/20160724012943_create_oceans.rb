class CreateOceans < ActiveRecord::Migration[5.0]
  def change
    create_table :oceans do |t|

      t.timestamps
    end
  end
end
