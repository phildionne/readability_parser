# Readability Parser
A tiny ruby wrapper for Readability's [Parser API](http://www.readability.com/developers/api/parser)

[![Gem Version](https://badge.fury.io/rb/readability_parser.png)](http://badge.fury.io/rb/readability_parser)
[![Code Climate](https://codeclimate.com/github/phildionne/readability_parser.png)](https://codeclimate.com/github/phildionne/readability_parser)
[![Dependency Status](https://gemnasium.com/phildionne/readability_parser.png)](https://gemnasium.com/phildionne/readability_parser)
[![Build Status](https://travis-ci.org/phildionne/readability_parser.png)](https://travis-ci.org/phildionne/readability_parser)
[![readability_parser API Documentation](https://www.omniref.com/ruby/gems/readability_parser.png)](https://www.omniref.com/ruby/gems/readability_parser)

## Installation
Add this line to your application's Gemfile:

    gem 'readability_parser'

And then execute:

    bundle install

## Configuration

Single token usage:

```ruby
ReadabilityParser.api_token = READABILITY_API_TOKEN
```

or set multiple options with a block:

```ruby
ReadabilityParser.configure do |readability|
  readability.api_token = READABILITY_API_TOKEN
  readability.format = :json
end
```

Make sure to set `READABILITY_API_TOKEN` in your environement variables. You can get an API key by contacting Readability's team directly, more information on their [api documentation page](https://www.readability.com/developers/api).

Multiple tokens or multithreaded usage:

```ruby
client = ReadabilityParser::Client.new(api_token: READABILITY_API_TOKEN)
```

## Usage

### Parse

Parse a webpage and return its main content:

```ruby
article = ReadabilityParser.parse("http://www.paulgraham.com/really.html")
=> #<ReadabilityParser::Article domain="www.paulgraham.com", next_page_id=nil, url="http://www.paulgraham.com/really.html", short_url="http://rdd.me/vki6sx0x", author=nil, excerpt="Want to start a startup? Get funded by Y Combinator . October 2009 (This essay is derived from a talk at the 2009 Startup School.) I wasn't sure what to talk about at Startup School, so I decided to...", direction="ltr", word_count=4982, total_pages=0, content="<div><td width="455"><img src="http://ep.yimg.com/ca/I/paulgraham_2135_250213" width="243" border="0" hspace="0" vspace="0" alt="What Startups Are Really Like"> ...", date_published=nil, dek=nil, lead_image_url=nil, title="What Startups Are Really Like", rendered_pages=1>

article.domain
article.author
article.url
article.short_url
article.title
article.total_pages
article.word_count
article.content
article.date_published
article.next_page_id
article.rendered_pages
```

### Format

You may specify the response format to `:json` or `:xml`, default to `:json`. Either way, the response will be parsed and returned as a `ReadabilityParser::Article` object.

## Contributing

1. Fork it
2. [Create a topic branch](http://learn.github.com/p/branching.html)
3. Add specs for your unimplemented modifications
4. Run `bundle exec rspec`. If specs pass, return to step 3.
5. Implement your modifications
6. Run `bundle exec rspec`. If specs fail, return to step 5.
7. Commit your changes and push
8. [Submit a pull request](http://help.github.com/send-pull-requests/)

## Inspiration
Design inspired from [twitter](https://github.com/sferik/twitter) and [octokit](https://github.com/pengwynn/octokit) api wrappers.

## Author
[Philippe Dionne](http://www.phildionne.com)

## Copyright
Copyright (c) 2013 Philippe Dionne

## License
MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
