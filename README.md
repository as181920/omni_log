# OmniLog
通用日志记录(Rails engine)

## Usage

Clean data
```sql
SELECT drop_chunks('omni_log_api_logs', INTERVAL '3 months');
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'omni_log', git: "git@github.com:as181920/omni_log.git", branch: "master"
```

And then execute:
```bash
$ bundle
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
