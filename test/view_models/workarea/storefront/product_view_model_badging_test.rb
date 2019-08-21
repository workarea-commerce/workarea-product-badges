require "test_helper"

module Workarea
  module Storefront
    class ProductViewModelBadgingTest < TestCase
      def test_badges_returns_array_of_badges
        product = create_product(name: "test", badges: ["Test"])

        badges = ProductViewModel.new(product).badges
        assert_equal(["New", "Test"], badges)
      end

      def test_automatic_badges_returns_new_badge
        product = create_product(name: "test")
        automatic_badges = ProductViewModel.new(product).automatic_badges
        assert_equal(["New"], automatic_badges)
      end

      def test_automatic_badges_returns_sale_badge
        product = create_product(
          variants: [{
            sku: "SKU4",
            regular: 10.to_m,
            on_sale: true,
            sale: 5.to_m
          }]
        )
        automatic_badges = ProductViewModel.new(product).automatic_badges

        assert_equal(["New", "Sale"], automatic_badges)
      end

      def test_automatic_badges_returns_best_seller_badge
        product = create_product(id: "foo")
        product_two = create_product(id: "bar")
        create_top_products(results: [{ product_id: product.id }, { product_id: product_two.id }])

        automatic_badges = ProductViewModel.new(product).automatic_badges
        assert_equal(["New", "Best Seller"], automatic_badges)
      end

      def test_badges_are_sorted_according_to_configuration
        Workarea.with_config do |config|
          config.product_badges[:sort] = ->(badges) { badges.sort_by { |b| ["New", "Custom Badge", "Another Badge"].find_index(b) || 999 } }

          product = create_product(
            id: "PROD4",
            name: "Multiple Badges Product",
            created_at:  Time.current - 1.days,
            badges: ["Custom Badge", "Another Badge"],
            variants: [{
              sku: "SKU4",
              regular: 10.to_m,
              on_sale: true,
              sale: 5.to_m
            }]
          )

          badges = ProductViewModel.new(product).badges

          assert_equal(["New", "Custom Badge", "Another Badge", "Sale"], badges)
        end
      end

      def test_badges_limited_by_max_badges_config
        Workarea.with_config do |config|
          config.product_badges[:max_badges] = 1

          product = create_product(
            name: "Two Badges Product",
            badges: ["One", "Two"]
          )

          badges = ProductViewModel.new(product).badges

          assert_equal(1, badges.count)
        end
      end
    end
  end
end
