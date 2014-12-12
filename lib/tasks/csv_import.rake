namespace :csv do

  desc "Import database from CSV source files"
  task :import => :environment do
    CSVImporter.new.import_all
  end

end
