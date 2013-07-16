class LettersValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    # TODO: Use I18n for validation message
    record.errors[attribute] << 'must contain only letters' unless is_all_letters?(value)
  end

  private

  def is_all_letters?(string)
    split(string).all? { |c| is_letter?(c) }
  end

  def split(string)
    string.to_s.split(//)
  end

  def is_letter?(character)
    letters.include?(character.upcase)
  end

  def letters
    @_letters ||= ('A'..'Z').to_a
  end
end
