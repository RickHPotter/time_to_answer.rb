# frozen_string_literal: true

# Father Class for all our lil minions
class DatatableBase
  def initialize(only, except, query)
    @only = only
    @except = except
    @query = query
  end

  def columns = raise NoMethodError
  def datum = raise NoMethodError
  def records = raise NoMethodError

  def process_only_and_except
    if @only.present?
      @columns.select! { |key| @only.include?(key) }
      @datum.select! { |key| @only.include?(key) }
    end
    return unless @except.present?

    @columns.reject! { |key| @only.include?(key) }
    @datum.reject! { |key| @only.include?(key) }
  end

  def labelise_columns
    @columns.each_key do |key|
      inner_hash = @columns[key]
      source = inner_hash[:source]

      if source.present? && inner_hash[:label].blank?
        inner_hash[:label] = I18n.t("activerecord.attributes.#{source.downcase}")
      end
    end
  end

  def datatable
    records
    columns
    datum
    process_only_and_except
    labelise_columns
    [@columns, @datum]
  end
end
