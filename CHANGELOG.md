Workarea Product Badges 1.3.1 (2019-06-11)
--------------------------------------------------------------------------------

*   Add minimum version requirement for Workarea v3.4

    * As of v1.3.0 product badges requries workarea v3.4.0 or higher

    PRODBADGE-10
    Jake Beresford



Workarea Product Badges 1.3.0 (2019-03-19)
--------------------------------------------------------------------------------

*   Update for v3.4 compatibility

    * Update implementation of top_sellers badge to use new Insights properly
    * Update gemfile format
    * Use integration tests instead of system tests for speed and to prevent weirdness.
    * Set test/dummy to use 5.2
    * Fix engine_path in bin/rails
    * Remove require workarea from bin/rails
    * rubocop fixes

    PRODBADGE-8
    Jake Beresford

*   Update for v3.4 compatibility

    * Use Insights instead of deprecated Analytics when determining best sellers
    * Update CI scripts

    PRODBADGE-8
    Matt Dunphy



Workarea Product Badges 1.2.0 (2018-10-30)
--------------------------------------------------------------------------------

*   Allow field used for new badge to be configured

    PRODBADGE-4
    Jake Beresford



Workarea Product Badges 1.1.0 (2018-09-19)
--------------------------------------------------------------------------------

*   Add badges to product detail page

    * Append badges partial to storefront.product_description
    * Add scoped styles for badges on PDP

    PRODBADGE-7
    Jake Beresford

*   Prevent pointer events on badges

    * Allow user to click link behind a badge component, like a linked product_summary image

    PRODBADGE-6
    Jake Beresford



Workarea Product Badges 1.0.0 (2018-04-11 10:58:26 -0400)
--------------------------------------------------------------------------------

*   Workarea Product Badges Plugin

    Allows products to be 'badged' either manually via the admin/product import or
    via logic-based automatic badges.  Admins can add badges via a CSV of
    values or toggle rule-based badges like 'sale' or 'new'.  Badges are
    displayed on product summary.

    PRODBADGE-1
    Jake Beresford


Workarea Product Badges 1.0.0 (2018-04-10 15:14:42 -0400)
--------------------------------------------------------------------------------

*   Workarea Product Badges Plugin

    Allows products to be 'badged' either manually via the admin/product import or
    via logic-based automatic badges.  Admins can add badges via a CSV of
    values or toggle rule-based badges like 'sale' or 'new'.  Badges are
    displayed on product summary.

    PRODBADGE-1
    Jake Beresford
