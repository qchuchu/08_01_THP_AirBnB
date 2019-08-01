class CreateStrollsAndDogs < ActiveRecord::Migration[5.2]
  def change
      create_table :dogs do |t|
        t.string :name
        t.string :breed
        t.belongs_to :city, index: true
        t.timestamps
      end

      create_table :strolls do |t|
        t.belongs_to :dogsitter, index: true
        t.datetime :date
        t.timestamps
      end

      create_table :dogs_strolls, id: false do |t|
        t.belongs_to :dog, index: true
        t.belongs_to :stroll, index: true
      end
  end
end
