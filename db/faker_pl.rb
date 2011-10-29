module Faker
  class PhoneNumber
    SIMPLE_FORMATS  = ['+48 58-###-###-###', '(58) ### ### ###']
    MOBILE_FORMATS  = ['(+48) ###-###-###', '###-###-###']

    def self.pl_phone_number(kind = :simple)
      Faker::Base.numerify const_get("#{kind.to_s.upcase}_FORMATS").sample
    end
  end
end

