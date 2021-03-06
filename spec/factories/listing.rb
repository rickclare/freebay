FactoryBot.define do
  factory :listing do
    title { 'Apple MacBook Pro' }
    description { '13" MacBook Pro, Late 2015' }
    starting_price { 400 }
    end_time { Date.today + 7.days }
    current_price { 400 }
    condition { 'poor'}
    category { 'macbook_pro'}
  end
end
