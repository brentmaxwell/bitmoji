#!/bin/sh
cat bitmoji.json | jq '.friends|map([.src]+.tags)[]' -c | ruby -ne 'puts $_.sub "%s", %w[137595951_70-s5].sample' | ruby -rjson -ne 'url, *tags = JSON.parse($_); puts "<div class=\"friends\"><img src=\"#{url}&width=300\" /><ul>#{tags.map {|t| "<li>#{t}</li>"}.join}</ul></div>"; BEGIN { puts "<style> body * { margin: 0; padding: 0; display: inline-block; } li { display: block; } .friends { width: 300px; } </style>" }'  > friends.html

