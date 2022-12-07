# frozen_string_literal: true

namespace :db do
  desc 'Export rows from all models ready for seeding'
  task export_db: :environment do
    I18n.available_locales.each do |locale|
      I18n.locale = locale

      puts "# rows for #{locale} locale"
      puts "I18n.locale = #{locale}"

      models = %w[User SessionType Page Event Session]

      models.each do |model|
        model.constantize.all.each do |row|
          excluded_keys = %w[created_at updated_at id]
          serialized = row
                       .serializable_hash
                       .delete_if { |key, _value| excluded_keys.include?(key) }
          puts "#{model}.where(#{serialized}).first_or_create!"
        end
      end

      puts
    end
  end
end
