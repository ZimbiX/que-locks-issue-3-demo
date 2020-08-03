require 'awesome_print'

module MyApp
  module Jobs
    class Increment < Que::Job
      # For testing, allow enqueuing duplicate jobs
      self.exclusive_execution_lock = true if ENV['QUE_LOCKS'] == 'true'

      def run(id:)
        DB.transaction do
          counter = DB[:counters].where(id: id)
          orig = counter.get(:n)
          sleep (rand / 10.0)
          updated = orig + 1
          ap "#{id}: #{updated}"
          counter.update(n: updated)
          destroy
        end
      end
    end
  end
end
