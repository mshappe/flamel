class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :sca_name

      t.timestamps
    end
  end
end
