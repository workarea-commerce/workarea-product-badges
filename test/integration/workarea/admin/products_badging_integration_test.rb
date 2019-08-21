module Workarea
  module Admin
    class ProductsBadgingIntegrationTest
      def test_updates_a_product_with_custom_badges
        product = create_product(variants: [])

        patch admin.catalog_product_path(product),
          params: { product: { badges: ["Test", "Custom", "Badges"] } }

        product.reload
        assert_equal(["Test", "Custom", "Badges"], product.badges)
      end
    end
  end
end
