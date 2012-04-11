FactoryGirl.define do
  factory :topic do
    
    factory :valid_topic do
      name "Wombat"
    end
  end
  
  factory :subtopic do
    
    factory :named_subtopic do
      name "Wombat herding"
      
      factory :valid_subtopic do
        topic FactoryGirl.build :valid_topic 
      end
    end
  end
  
  sequence :valid_subtopics do |n|
    "Wombat subtopic #{n}"
  end
  
  factory :person do
    
    factory :named_person do
      sca_name "Maol Mhichil mac Ghiolla Pheadair"
    end
      
    factory :associated_person do
      sca_name "Margaret Fitzwilliam of Kent"
      after_create do | person, evaluator |
        FactoryGirl.build_list( :valid_subtopic, 1, people: [person] )
      end
    end
  end 
  
  sequence :valid_people do |n|
    "Llama McLlamson the #{n}"
  end  
end