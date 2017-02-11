FactoryGirl.define do
  factory :menu_item do
    menu_option { ["Meal 1", "Meal 2", "Meal 3"].sample }
    meal nil
    menu nil
    day { ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"].sample }
  end
end
