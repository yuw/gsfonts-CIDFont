#! /usr/bin/env ruby1.9.1
# -*- coding: utf-8 -*-
#
# ps-otfnames.rb dir
#
# PostScript nameとOTFファイル名を標準出力する
#
# require: otfinfo

dirname = ARGV[0].sub(/\/$/,"")
otfnames = Dir.glob("#{dirname}/*.otf")
otfnames.each do |otf|
  otf.sub!("./","")
  otf.gsub!(" ","\\ ")
  psname = `otfinfo -i #{otf} | grep \"PostScript name\"`
  psname.sub!("PostScript name:     ","").sub!("\n","")
  puts "\"#{psname}\",\"#{otf}\""
end
