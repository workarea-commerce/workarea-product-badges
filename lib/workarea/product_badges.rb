require "workarea"
require "workarea/storefront"
require "workarea/admin"

require "workarea/product_badges/engine"
require "workarea/product_badges/version"

module Workarea
  module Badges
    def self.new_threshold
      config[:new_threshold].try(&:to_i) || 30
    end

    def self.number_of_top_sellers
      config[:number_of_top_sellers].try(:to_i) || 10
    end

    def self.max_badges
      config[:max_badges].try(:to_i)
    end

    def self.sort
      config[:sort]
    end

    def self.config
      Workarea.config.product_badges
    end
  end
end
