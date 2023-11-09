# frozen_string_literal: true

# Father Class for all our lil minions
class DatatableBase
  # INSTANCE METHODS
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
      next if inner_hash[:source].blank? || inner_hash[:label].present?

      source = inner_hash[:source].downcase
      inner_hash[:label] = if source.include?('.')
                             I18n.t("activerecord.attributes.#{source}")
                           else
                             I18n.t("activerecord.models.#{source}.one")
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
