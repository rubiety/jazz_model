# Blatantly stolen from http://matthewbass.com/2007/03/07/overriding-existing-rake-tasks/
Rake::TaskManager.class_eval do
  def remove_task(task_name)
    @tasks.delete(task_name.to_s)
  end
end
 
def remove_task(task_name)
  Rake.application.remove_task(task_name)
end
 
namespace :db do
  namespace :test do 
    # Remove rails default test database preparation
    remove_task "db:test:prepare"

    # Overwrite with an extended test database prepare that recognizes a new schema_format.
    desc "Overwritten standard prepare to include parsing of :migrate schema_format type."
    task :prepare => :environment do
    # Rake::Task[{ :sql  => "db:test:clone_structure", :ruby => "db:test:clone" }[ActiveRecord::Base.schema_format]].invoke
    schema_format = ActiveRecord::Base.schema_format
    case schema_format
      when :sql
        Rake::Task["db:test:clone_structure"].invoke
      when :ruby
        Rake::Task["db:test:clone"].invoke
      when :migrate
        # Use a migration to ready the test database
        # Useful when :sql or :ruby are failing which occurs universally when
        # VIEWS or STORED PROCEDURES are present.
        Rake::Task["db:test:purge"].invoke
        ActiveRecord::Base.establish_connection(ActiveRecord::Base.configurations['test'])
        ActiveRecord::Schema.verbose = false
        Rake::Task["db:migrate"].invoke
      else # This could also default to :ruby... DHH thoughts on this?
        raise "Task not supported by '#{schema_format}'"
      end
    end
  end
end
