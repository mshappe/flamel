FactoryGirl.define do
  factory :topic do
    
    factory :valid_topic do
      sequence :name, Faker::Lorem.sentence
    end
  end
  
  factory :subtopic do
    
    factory :named_subtopic do
      sequence :name, Faker::Lorem.sentence
      
      factory :valid_subtopic do
        association :topic, factory: :valid_topic
      end
    end
  end

  factory :person do
    
    factory :valid_person do
      sequence :sca_name, Faker::Name.name
      association :group, factory: :valid_group
    end
      
    factory :associated_person do
      sequence :sca_name, Faker::Name.name
      association :group, factory: :valid_group
      after :create do | person, evaluator |
        FactoryGirl.build_list( :valid_subtopic, 5, people: [person] )
      end
    end
  end 

  factory :group do
    factory :valid_group do
      sequence :name, Faker::Lorem.sentence
    end
  end
end