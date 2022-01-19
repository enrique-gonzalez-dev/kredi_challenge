class Link < ApplicationRecord
    validates :short, uniqueness: true

    belongs_to :user
    has_many :views

    def get_code
        time = DateTime.now.strftime("%Q").scan /../
        base = ('1'..'9').to_a + ('a'..'z').to_a + ('A'..'Y').to_a
        code = ""
        time.each do |t|
            if t.to_i < 60
                code += base[t.to_i].to_s
            else
                case t.to_i
                when 0..10
                    code += base[0]
                when 11..20
                    code += base[5]
                when 21..30
                    code += base[10]
                when 31..40
                    code += base[15]
                when 41..50
                    code += base[20]
                when 51..60
                    code += base[25]
                when 61..70
                    code += base[30]
                when 71..80
                    code += base[35]
                when 81..90
                    code += base[40]
                when 91..101
                    code += base[45]
                else
                    code += base[50]
                end
            end
        end
        code
    end
    
end
