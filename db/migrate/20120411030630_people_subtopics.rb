class PeopleSubtopics < ActiveRecord::Migration
  def up
    create_table :people_subtopics, :id => false do |t|
      t.references :person, :subtopic
    end

    add_index :people_subtopics, [ :person_id, :subtopic_id ]
  end

  def down
    drop_index :people_subtopics
    drop_table :people_subtopics
  end
end
