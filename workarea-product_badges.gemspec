$:.push File.expand_path("../lib", __FILE__)

require "workarea/product_badges/version"

Gem::Specification.new do |s|
  s.name        = "workarea-product_badges"
  s.version     = Workarea::ProductBadges::VERSION
  s.authors     = ["Jake Beresford"]
  s.email       = ["jberesford@weblinc.com"]
  s.homepage    = "https://github.com/workarea-commerce/workarea-product_badges"
  s.summary     = "Product badges for the workarea ecommerce platform"
  s.description = "Add product badges to your storefront"

  s.files = `git ls-files`.split("\n")

  s.license = 'Business Software License'

  s.add_dependency "workarea", "~> 3.x", ">= 3.4.x"
end
