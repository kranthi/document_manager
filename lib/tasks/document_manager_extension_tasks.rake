namespace :radiant do
  namespace :extensions do
    namespace :document_manager do
      
      desc "Runs the migration of the Document Manager extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          DocumentManagerExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          DocumentManagerExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Document Manager to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from DocumentManagerExtension"
        Dir[DocumentManagerExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(DocumentManagerExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
