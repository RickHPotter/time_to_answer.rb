# frozen_string_literal: true

# TranslateHelper for i18n and model / attributes
module TranslateHelper
  def model_on_count(instances)
    model = instances.first.class
    count = instances.count
    model.model_name.human.pluralize(count)
  end
end
