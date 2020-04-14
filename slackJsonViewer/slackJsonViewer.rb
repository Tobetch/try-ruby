# SlackでバックアップしたJSONを読み込むプログラム
require "time"
require "json"

def list()
  Dir.glob("**/*.json") do |item|
    puts item
  end
end

def loadJson(file:)
  if File.exist?(file)
    puts "#{"----------" * 8}"
    puts "ファイル名：#{file}"
    File.open(file) do |j|
      messages = JSON.load(j)
      messages.each do |msg|
        if !msg["user"].empty? && !msg["text"].empty?
          puts "#{msg["user"]}さんの発言：#{msg["text"]}"
        end
      end
      puts "メッセージ件数は#{messages.length}"
    end
  end
end

##################
targetDir = "./target"
targetFileList = Dir.glob("**/*.json")

today = Date.today # YYYY-MM-DD形式
startDate = Date.new(today.year - 1, today.month, today.day)

(startDate..today).each do |date|
  targetFile = targetDir + "/" + date.to_s + ".json"
  loadJson(file: targetFile)
end
##################
