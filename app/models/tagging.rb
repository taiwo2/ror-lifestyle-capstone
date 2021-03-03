class Tagging < ApplicationRecord
  belongs_to :Tag
  belongs_to :article
end
