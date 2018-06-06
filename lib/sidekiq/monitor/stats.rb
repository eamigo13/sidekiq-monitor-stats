require 'sidekiq/api'
require 'sidekiq/web'
require 'sidekiq/monitor/web'

module Sidekiq
  module Monitor
    class Stats
      def queue_metrics
        Sidekiq::Queue.all.each_with_object({}) do |queue, hash|
          hash[queue.name] = {
            backlog: queue.size,
            latency: queue.latency.to_i
          }
        end
      end

      def process_metrics
        Sidekiq::ProcessSet.new.map do |process|
          {
            hostname:    process['hostname'],
            pid:         process['pid'],
            tag:         process['tag'],
            started_at:  Time.at(process['started_at']),
            queues:      process['queues'],
            labels:      process['labels'],
            concurrency: process['concurrency'],
            busy:        process['busy']
          }
        end
      end
      def sidekiq_stats
        Sidekiq::Stats.new do |stat|
          {
            processed:  stat.processed,
            failed:     stat.failed,
            scheduled_size: stat.scheduled_size,
            retry_size: stat.retry_size,
            dead_size: stat.dead_size,
            processes_size: stat.processes_size,
            default_queue_latency: stat.default_queue_latency,
            workers_size: stat.workers_size,
            enqueued: stat.enqueued
          }
      end
    end
  end
end

Sidekiq::Web.register(Sidekiq::Monitor::Web)
