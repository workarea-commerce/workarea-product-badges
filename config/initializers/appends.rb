module Workarea
  Plugin.append_partials(
    "admin.product_fields",
    "workarea/admin/catalog_products/badge_fields"
  )

  Plugin.append_partials(
    "storefront.product_summary",
    "workarea/storefront/products/badges"
  )

  Plugin.append_partials(
    "storefront.product_description",
    "workarea/storefront/products/badges"
  )

  Plugin.append_stylesheets(
    "storefront.components",
    "workarea/product_badges/components/badges"
  )
end
