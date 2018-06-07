# Sidekiq Monitor Stats

[![Gem Version](https://badge.fury.io/rb/sidekiq-monitor-stats.svg)](http://badge.fury.io/rb/sidekiq-monitor-stats)
[![Build Status](https://travis-ci.org/harvesthq/sidekiq-monitor-stats.svg)](https://travis-ci.org/harvesthq/sidekiq-monitor-stats)
[![Code Climate](https://codeclimate.com/github/harvesthq/sidekiq-monitor-stats/badges/gpa.svg)](https://codeclimate.com/github/harvesthq/sidekiq-monitor-stats)

This is a fork of sidekiq-monitor-stats created by harvesthq
To see the original repo go to https://github.com/harvesthq/sidekiq-monitor-stats.

This fork has the added functionality of returning the stats in Sidekiq::Stats.new in the json payload.  Below is an example of the additional stats that are returned.

"stats": {
   "processed": 179,
   "failed": 136,
   "scheduled_size": 0,
   "retry_size": 0,
   "dead_size": 2,
   "processes_size": 10,
   "default_queue_latency": 0,
   "workers_size": 0,
   "enqueued": 153
}
