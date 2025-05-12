loop do
  require "csv"

  puts "1 → 新規メモを作成 / 2 → 既存のメモを編集 / 3 → 既存のメモを確認" 
  memo_type = gets.to_i

  if memo_type == 1
    puts "新規メモの拡張子を除いたファイル名を入力してください"
    memo_name = gets.chomp
    CSV.open("#{memo_name}.csv","w") do |csv|
      puts "メモしたい内容を入力"
      memo_text = gets.chomp
      csv << [memo_text]
      puts "メモが作成されました"
      puts "#{memo_name} : #{memo_text}"
    end

  elsif memo_type == 2
    puts "編集したいメモの拡張子を除いたファイル名を入力してください"
    memo_name = gets.chomp
    if File.exist?("#{memo_name}.csv")
      puts "#{memo_name} :"
      puts "#{File.read("#{memo_name}.csv")}"
      CSV.open("#{memo_name}.csv", "a") do |csv|
        puts "追加したい内容を入力"
        memo_text = gets.chomp
        csv << [memo_text]
        puts "メモが追加されました"
      end
    else
      puts "ファイルが存在しません"
    end

  elsif memo_type == 3
    puts "確認したいメモの拡張子を除いたファイル名を入力してください"
    memo_name = gets.chomp
    if File.exist?("#{memo_name}.csv")
      puts "#{memo_name} :"
      puts "#{File.read("#{memo_name}.csv")}"
    else
      puts "ファイルが存在しません"
    end
    
  else
    puts "正しい値を入力してください"
  end

end
