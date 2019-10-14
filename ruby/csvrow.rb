#!/usr/bin/ruby
module ActsAsCsv
    def self.included(base)
        base.extend ClassMethods
    end
    
    module ClassMethods
        def acts_as_csv
            include InstanceMethods
        end
    end

    class CsvRow
        def method_missing name, *args
            row_name = name.to_s
            @row_contents[row_name]
        end

        attr_accessor :row_contents
        def initialize(headers, row)
            @row_contents = {}
            i = 0
            row.chomp.gsub(/\s+/, '').split(',').each do |each_row|
                @row_contents[headers[i]] = each_row
                i = i+1
            end
        end
    end

    module InstanceMethods
        def read
            @csv_contents = []
            filename = self.class.to_s.downcase + '.txt'
            file = File.new(filename)
            @headers = file.gets.chomp.gsub(/\s+/, '').split(',')

            file.each do |row|
                @csv_contents << CsvRow.new(@headers, row)
            end
        end

        attr_accessor :headers, :csv_contents

        def initialize
            read
        end

        def each
            @csv_contents.each do |row|
                yield row
            end
        end
    end
end

class RubyCsv
    include ActsAsCsv
    acts_as_csv
end

csv = RubyCsv.new
# puts 'headers: ', csv.headers.inspect
# puts 'csv_contents: ', csv.csv_contents.inspect

# csv.each {|row| puts row.row_contents}
csv.each {|row| puts row.one}

