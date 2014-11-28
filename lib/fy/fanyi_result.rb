require 'uri'
require 'net/http'
require 'json'
require 'rainbow/ext/string'

module Fy
  class FanyiResult

    attr_reader :words_array

    def initialize(words_array)
      @words_array = words_array
    end

    def api_url
      'http://fanyi.youdao.com/openapi.do?keyfrom=JIANGDi&key=891853312&type=data&doctype=json&version=1.1&q='
    end

    def query_words
      words_array.join(' ')
    end

    def escape_words
      URI.escape(words_array.join('+'))
    end

    def query_url
      api_url + escape_words
    end

    def query_uri
      URI(query_url)
    end

    def result_json
      Net::HTTP.get(query_uri)
    end

    def result_hash
      JSON.parse(result_json)
    end

    def yd_translations_array
      result_hash['translation']
    end

    def fancy_translation(yd_translation)
      "  #{yd_translation}".color(:green)
    end

    def puts_yd_translations
      yd_translations_array.each do |translation|
        puts fancy_translation(translation)
      end
      puts
    end

    def dict_info
      result_hash['basic']
    end

    def phonetic
      dict_info['phonetic'] if dict_info
    end

    def fancy_phonetic
      " [ #{phonetic} ]".color(:magenta)
    end

    def puts_first_line
      first_line = ' '
      first_line += query_words
      first_line += fancy_phonetic if phonetic
      puts first_line, ''
    end

    def dict_explains_array
      dict_info['explains'] if dict_info
    end

    def fancy_dict_explain(explain)
      ' - ' + "#{explain}".color(:green)
    end

    def puts_dict_explains
      dict_explains_array.each do |explain|
        puts fancy_dict_explain(explain)
      end
      puts
    end

    def web_result_array
      result_hash['web']
    end

    def fancy_web_result_value(web_result_value)
      '    ' + web_result_value.join(', ').color(:cyan)
    end

    def highlight_words(sentence, words)
      sentence.gsub(/#{words}/i, words.color(:yellow))
    end

    def fancy_web_result_key(web_result_key)
      highlight_words(web_result_key, query_words)
    end

    def puts_web_result_array
      web_result_array.each_with_index do |web_result_hash, i|
        puts " #{i+1}. #{fancy_web_result_key(web_result_hash['key'])}"
        puts fancy_web_result_value(web_result_hash['value'])
      end
      puts
    end

    # 一般来说，有道词典解释的比较好
    # 但是长一点的句子有道词典没有结果，需要用有道翻译
    # 所以如果有道词典有结果就只用词典的结果，否则用有道翻译
    def puts_yd_result
      if dict_info.nil?
        puts_yd_translations
      else
        puts_dict_explains
      end
    end

    def puts_result
      puts_first_line
      puts_yd_result
      puts_web_result_array if web_result_array
    end
  end
end
