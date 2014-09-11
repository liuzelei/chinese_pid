class ChinesePid
  CITY_CODES = { 
                "11" => "北京市", "12" => "天津市", "13" => "河北省", "14" => "山西省", "15" => "内蒙古自治区", 
                "21" => "辽宁省", "22" => "吉林省", "23" => "黑龙江省", 
                "31" => "上海市", "32" => "江苏省", "33" => "浙江省", "34" => "安徽省", "35" => "福建省", "36" => "江西省", "37" => "山东省", 
                "41" => "河南省", "42" => "湖北省", "43" => "湖南省", "44" => "广东省", "45" => "广西壮族自治区", "46" => "海南省", 
                "50" => "重庆市", "51" => "四川省", "52" => "贵州省", "53" => "云南省", "54" => "西藏自治区", 
                "61" => "陕西省", "62" => "甘肃省", "63" => "青海省", "64" => "宁夏回族自治区", "65" => "新疆维吾尔自治区", 
                "71" => "台湾省", 
                "81" => "香港特别行政区", "82" => "澳门特别行政区", 
                "91" => "国外" 
              }

  def initialize(pid)
    @pid = pid
  end

  def gender
    return nil unless valid?
    if old_standard?
      return @pid[14].to_i % 2
    else
      return @pid[16].to_i % 2
    end
  end

  def valid?
    return false if @pid.size != 15 && @pid.size != 18
    return false unless /^\d{6}(18|19|20)?\d{2}(0[1-9]|1[12])(0[1-9]|[12]\d|3[01])\d{3}(\d|x|X)?$/.match(@pid)
    return false if CITY_CODES[@pid[0, 2]].nil?
    unless old_standard?
      factor = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2]
      parity = [1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2]
      sum = 0
      for index in 0..16
        sum += @pid[index].to_i * factor[index]
      end
      return false if parity[sum % 11].to_s.upcase != @pid[17].to_s.upcase
    end
    return true
  end

  def birthday
    return nil unless valid?
    if old_standard?
      return Date.parse("19#{@pid[6, 6]}")
    else
      return Date.parse(@pid[6, 8])
    end
  end

  def old_standard?
    return true if @pid.size == 15
    return false
  end
end