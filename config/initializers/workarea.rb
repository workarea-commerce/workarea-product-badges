Workarea.configure do |config|
  config.product_badges = {
    new_threshold: 30,
    new_date_field: :created_at,
    number_of_top_sellers: 10,
    max_badges: nil,
    sort: ->(badges) { badges.sort_by { |b| ["New", "Sale", "Best Seller"].find_index(b) || 999 } }
  }
end
