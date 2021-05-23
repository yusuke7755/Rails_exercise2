class Contact < ApplicationRecord
    # contentカラムでは、1文字以上140文字以下しか保存できないようにする
    validates :content, presence: true, length: { in: 1..140 }
end
