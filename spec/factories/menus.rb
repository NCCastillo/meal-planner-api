FactoryGirl.define do
  factory :menu do
    week_of { "#{Date.today.beginning_of_week}_#{Date.today.end_of_week}" }
    user nil
  end
end
