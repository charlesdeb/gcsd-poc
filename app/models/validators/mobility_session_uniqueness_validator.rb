# frozen_string_literal: true

# validates uniqueness of a mobility translated column
# based on https://stackoverflow.com/questions/72537592/how-to-use-validations-with-mobility-gem
class MobilitySessionUniquenessValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, _value)
    return unless translation_exists?(record, attribute)

    attribute, _locale = attribute.to_s.split('_')

    record.errors.add(attribute, "'#{record.send(attribute)}' has already been taken for this event")
  end

  private

  def translation_exists?(record, attribute)
    attribute, locale = attribute.to_s.split('_')

    # exclude this current record in the search
    where_clause =
      record.id.nil? ? '1=1' : ['sessions.id != ?', record.id]

    record.class.joins(:plain_text_translations)
          .where(where_clause)
          .exists?(
            { event_id: record.event_id,
              action_text_rich_texts: { locale: locale,
                                        body: record.send(attribute) } }
          )
  end
end
