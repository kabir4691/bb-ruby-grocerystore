require_relative 'constants'

module Validator
  
  def self.validateInput(inputItems)
    if inputItems.empty? 
      puts 'No items entered'
      return false
    end

    itemNames = Constants::ITEM_MAPPINGS.keys
    filteredItems = inputItems.select { |item| itemNames.include?(item.to_sym) }

    if filteredItems.empty? 
      puts 'Please enter valid items'
      return false
    end

    return true
  end
end