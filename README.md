Workarea Badges
================================================================================

Badges plugin for the Workarea platform.
Adds badges to product summary and product detail views.

Badges can be added to products manually, or via a product import by specifying
a comma-separated list in the product[:badges] field.

In addition to custom badges via the product[:badges] field this plugin provides
automatic badging for products. Out of the box automatic badges are:

* New
* Sale
* Best Seller

Getting Started
--------------------------------------------------------------------------------

Add the gem to your application's Gemfile:

```ruby
# ...
gem 'workarea-product_badges'
# ...
```

Update your application's bundle.

```bash
cd path/to/application
bundle
```

Configuration
--------------------------------------------------------------------------------

The following configuration can be added to your host app and adjusted as necessary:

```ruby
Workarea.configure do |config|
  config.product_badges = {
    new_threshold: 30,
    new_date_field: :created_at,
    number_of_top_sellers: 10,
    max_badges: nil,
    sort: ->(badges) { badges.sort_by{ |b| ["New", "Sale", "Best Seller"].find_index(b) || 999 } }
  }
end
```

### new_threshold

* type: integer
* default: 30
* products created in this time will receive a 'New' badge

### new_date_field

* type: symbol
* default: :created_at
* Specify which field will be used to calculate whether a product should display
  the 'new' badge.

### number_of_top_sellers

* type: integer
* default: 10
* Description: Number of products from top sellers to apply a badge to

### max_badges

* type: integer
* default: nil
* Description: limits the number of badges that can be applied to any product

### sort

* type: Lambda
* default: ->(badges) { badges.sort_by{ |b| ["New", "Sale", "Best Seller"].find_index(b) || 999 } }
* Description: Specify the order in which badges should appear, this lambda can
  be updated to sort badges according to any business logic without decoration.
  By default the plugin will sort automatic badges first followed by custom badges.
  Custom badges will display in the order they appear in the admin.

#### Implementing a custom sort class

For more complicated sorting logic, a sorting class can be implemented as long as
it responds to .call example

```ruby
class MyBadgeSort
  def self.call(badges)
    new(badges).results
  end

  def initialize(badges)
    @badges = badges
  end

  def results
    # do all sorts of crazy complex stuff
  end
end
```

Then update your configuration to:

```ruby
  Workarea.config.product_badges[:sort] = MyBadgeSort
```

Adding new automatic badges
--------------------------------------------------------------------------------

To add a new automatic badge in your host application you should decorate the
product_view_model automatic_badges method, calling super and injecting your badge
to the array.

Example:

```ruby
module Workarea
  decorate Storefront::ProductViewModel, with: :your_app_name do
    def automatic_badges
      super << custom_badge_method
    end

    private

    def custom_badge_method
      if logic_for_automatic_badge
        t('workarea.storefront.products.badges.[custom_badge_key]')
      end
    end
  end
end
```

Workarea Commerce Documentation
--------------------------------------------------------------------------------

See [https://developer.workarea.com](https://developer.workarea.com) for Workarea Commerce documentation.

License
--------------------------------------------------------------------------------

Workarea Product Badges is released under the [Business Software License](LICENSE)
