require "test_helper"

module Workarea
  module Admin
    class ProductBadgesSystemTest < Workarea::SystemTest
      include Admin::IntegrationTest

      setup :product

      def product
        @product ||= create_product(
          badges: ["Custom Badge"]
        )
      end

      def test_adding_a_custom_badge
        visit admin.catalog_product_path(@product)

        click_link "Attributes"

        fill_in "product[badges_list]", with: "Custom Badge, New Badge"

        click_button "save_product"
        assert(page.has_content?("Success"))
        assert_current_path(admin.catalog_product_path(@product))
      end
    end
  end
end
