require "test_helper"

module Workarea
  module Storefront
    class ProductBadgesSystemTest < Workarea::SystemTest
      include Storefront::SystemTest

      setup :set_products

      def set_products
        @products =
          [
            create_product(id:          "PROD1",
                           name:        "New Badge Product",
                           created_at:  Time.current - 1.hour,
                           variants:    [{ sku: "SKU1", regular: 10.to_m }]),
            create_product(id:          "PROD2",
                           name:        "Sale Badge Product",
                           created_at:  Time.current - 60.days,
                           variants:    [{
                             sku: "SKU2",
                             regular: 10.to_m,
                             on_sale: true,
                             sale: 5.to_m
                           }]),
            create_product(id:          "PROD3",
                           name:        "Custom Badge Product",
                           created_at:  Time.current - 60.days,
                           badges:      ["Custom Badge"],
                           variants:    [{ sku: "SKU3", regular: 10.to_m }]),
            create_product(id:          "PROD4",
                           name:        "Multiple Badges Product",
                           created_at:  Time.current - 1.days,
                           badges: ["Custom Badge", "Another Badge"],
                           variants:    [{
                             sku: "SKU4",
                             regular: 10.to_m,
                             on_sale: true,
                             sale: 5.to_m
                           }]),
          ]
      end

      def categorize_products(category)
        category.update_attributes!(
          product_ids: [@products.first.id, @products.second.id, @products.third.id]
        )
      end

      def test_badges_are_displayed
        category = create_category
        categorize_products(category)

        visit storefront.category_path(category)

        assert(page.has_content?("New"))
        assert(page.has_content?("Sale"))
        assert(page.has_content?("Custom Badge"))
      end
    end
  end
end
