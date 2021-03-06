# app/views/layouts/bobcat.rb
module LayoutsHelper
  def application_javascript
    javascript_include_tag "search"
  end

  def gauges?
    false
  end

  def google_analytics?
    google_analytics_tracking_code.present?
  end

  def google_analytics_tracking_code
    ENV['GOOGLE_ANALYTICS_TRACKING_CODE']
  end

  def google_tag_manager_tracking_code
    ENV['GOOGLE_TAG_MANAGER_TRACKING_CODE']
  end

  def breadcrumbs
    breadcrumbs = super
    breadcrumbs.pop
    breadcrumbs << link_to('Catalog', bobcat_breadcrumb_base_url)
  end
end
