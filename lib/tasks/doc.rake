namespace :doc do
  desc "Upload RDocs"
  task :upload do
    system "rsync -avz -e ssh doc/app/* bhughes@jazztoolbox.com:/var/www/jazztoolbox.com/public/rdoc"
  end
end

namespace :coverage do
  desc "Upload RCov Reports"
  task :upload do
    system "rsync -avz -e ssh coverage/* bhughes@jazztoolbox.com:/var/www/jazztoolbox.com/public/rcov"
  end
end
