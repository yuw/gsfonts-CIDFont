#! /usr/bin/env ruby1.9.1
# -*- coding: utf-8 -*-
#
# gsfonts-CID.rb fonts.csv output_dir
#
# GhostScriptで必要となる
# H, V, EUC-H, EUC-V, UniJIS-UTF16-H, UniJIS-UTF16-V
# の各ファイルを生成する
# fonts.csvの第一列にPostScript nameが記述されていることを前提とする
#

require "csv"

def create_font_files(psname)
  output = "#{ARGV[1]}/#{psname}"
  File.open("#{output}-H","w") do |file|
    file.puts %Q[/#{psname}-H
/H /CMap findresource
[/#{psname} /CIDFont findresource]
composefont pop
]
  end
  File.open("#{output}-V","w") do |file|
    file.puts %Q[/#{psname}-V
/V /CMap findresource
[/#{psname} /CIDFont findresource]
composefont pop
]
  end
  File.open("#{output}-Identity-H","w") do |file|
    file.puts %Q[/#{psname}-Identity-H
/Identity-H /CMap findresource
[/#{psname} /CIDFont findresource]
composefont pop
]
  end
  File.open("#{output}-Identity-V","w") do |file|
    file.puts %Q[/#{psname}-Identity-V
/Identity-V /CMap findresource
[/#{psname} /CIDFont findresource]
composefont pop
]
  end
  File.open("#{output}-EUC-H","w") do |file|
    file.puts %Q[/#{psname}-EUC-H
/EUC-H /CMap findresource
[/#{psname} /CIDFont findresource]
composefont pop
]
  end
  File.open("#{output}-EUC-V","w") do |file|
    file.puts %Q[/#{psname}-EUC-V
/EUC-V /CMap findresource
[/#{psname} /CIDFont findresource]
composefont pop
]
  end
  File.open("#{output}-UniJIS-UTF16-H","w") do |file|
    file.puts %Q[/#{psname}-UniJIS-UTF16-H
/UniJIS-UTF16-H /CMap findresource
[/#{psname} /CIDFont findresource]
composefont pop
]
  end
  File.open("#{output}-UniJIS-UTF16-V","w") do |file|
    file.puts %Q[/#{psname}-UniJIS-UTF16-V
/UniJIS-UTF16-V /CMap findresource
[/#{psname} /CIDFont findresource]
composefont pop
]
  end
end

Dir.mkdir(ARGV[1]) unless File.exist?(ARGV[1])

CSV.foreach(ARGV[0]) do |row|
  puts "#{row[0]}"
  create_font_files(row[0])
end
