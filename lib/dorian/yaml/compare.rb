require 'yaml'

module Dorian
  module Yaml
    class Compare
      def self.run
        if ARGV.size < 2 || ARGV.size > 4
          puts 'USAGE: yaml-compare FILE1 FILE2 [ROOT1] [ROOT2]'
          exit
        end

        file1 = YAML.safe_load(File.read(ARGV[0]))
        file2 = YAML.safe_load(File.read(ARGV[1]))
        root1 = ARGV[2]
        root2 = ARGV[3]
        file1 = file1[root1] if !root1.nil?
        file2 = file2[root2] if !root2.nil?

        compare(file1, file2)
      end

      def self.compare(hash1, hash2, current: '')
        if hash1.kind_of?(Array)
          hash1.each.with_index do |_, i|
            compare(hash1[i], hash2[i], current: current)
          end
        elsif hash1.kind_of?(String) || hash2.kind_of?(String)
          if !hash1.kind_of?(String)
            puts "key \"#{current}\" is a string in #{ARGV[1]}"
          elsif !hash2.kind_of?(String)
            puts "key \"#{current}\" is a string in #{ARGV[0]}"
          end
        else
          (hash1.keys + hash2.keys).uniq.each do |key|
            full_key = [current, key].reject(&:empty?).join(".")
            if !hash1.key?(key)
              puts "missing key \"#{full_key}\" from #{ARGV[0]}"
            elsif !hash2.key?(key)
              puts "missing key \"#{full_key}\" from #{ARGV[1]}"
            else
              compare(hash1[key], hash2[key], current: full_key)
            end
          end
        end
      end
    end
  end
end
