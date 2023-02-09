# frozen_string_literal: true

require 'csv'

namespace :merchants do
  desc 'Import Merchant records from CSV file'
  task :import_csv, [:path] => :environment do |_, args|
    #  file should have headers - %i[name description email status]
    path = args[:path]
    raise StandardError, 'Absolute path to file is required' if path.blank?

    success = failed = 0
    CSV.foreach(path, headers: true) do |row|
      merchant = Merchant.new(row.to_h.transform_values(&:strip))
      if merchant.save
        success += 1
        print '#' # notify in console about some progress
      else
        failed += 1
        print '-'
      end
    end

    puts <<-REPORT

      Imported successfully #{success} record(s)
      Failed #{failed} record(s)
    REPORT
  end
end
