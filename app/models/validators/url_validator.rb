# frozen_string_literal: true

# validates for a URL
# based on https://stackoverflow.com/questions/7167895/rails-whats-a-good-way-to-validate-links-urls
class UrlValidator < ActiveModel::EachValidator
  def self.compliant?(value)
    uri = URI.parse(value)
    (uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)) && uri.host.present?
  rescue URI::InvalidURIError
    false
  end

  def validate_each(record, attribute, value)
    return if value.blank?
    return if value.present? && self.class.compliant?(value)

    record.errors.add(attribute, 'is not a valid HTTP or HTTPS URL')
  end
end
