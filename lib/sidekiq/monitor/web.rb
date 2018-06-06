require 'sidekiq/monitor/stats'

module Sidekiq
  module Monitor
    module Web
      def self.registered(app)
        app.get "/monitor-stats" do
          monitor_stats = Monitor::Stats.new

          data = {
            queues:    monitor_stats.queue_metrics,
            processes: monitor_stats.process_metrics,
            stats: monitor_stats.sidekiq_stats
          }

          if Sidekiq::VERSION >= "5.0.0"
            json(data)
          else
            content_type :json
            Sidekiq.dump_json(data)
          end
        end
      end
    end
  end
end
