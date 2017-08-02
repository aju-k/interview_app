class UniqueCodeMethods

  class << self

    # Genrate unique code from record Id
    def generate_unique_code(num)
      unique_code = [];
      charset = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a
      while num > 0
        unique_code.push(charset[num % 62])
        num = num / 62
      end
      return unique_code.join.reverse
    end

    # Decode unique code and find id of record
    def decode_unique_code(unique_code)
      num = 0
      charset = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a
      unique_code.split('').each{|char| num = num * 62 + charset.index(char)}
      num
    end

  end

end