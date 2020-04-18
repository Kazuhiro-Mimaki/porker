class Porker < ApplicationRecord
  VALID_PORKER_REGEX = /\A[SHDC][1-9]|[SHDC]1[0-3]\s[SHDC][1-9]|[SHDC]1[0-3]\s[SHDC][1-9]|[SHDC]1[0-3]\s[SHDC][1-9]|[SHDC]1[0-3]\s[SHDC][1-9]|[SHDC]1[0-3]/i
  validates :text, presence: true, format: { with: VALID_PORKER_REGEX }
end