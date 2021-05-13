# typed: false
require_relative './test'
require 'json'

class Vonage::EntityTest < Minitest::Test
  def test_mapping_keyword_args_to_attribute_names
    value = 'xxxx-xxxx'

    entity = Vonage::Entity.new(id: value)

    assert_equal entity[:id], value
    assert_equal entity.id, value
  end

  def test_mapping_string_keys_to_attribute_names
    value = '2015-03-21 11:50:56'

    entity = Vonage::Entity.new
    entity['date_submitted'] = value

    assert_equal entity[:date_submitted], value
    assert_equal entity.date_submitted, value
  end

  def test_mapping_hyphenated_string_keys_to_underscored_attribute_names
    value = 'DELIVRD'

    entity = Vonage::Entity.new
    entity['final-status'] = value

    assert_equal entity[:final_status], value
    assert_equal entity.final_status, value
  end

  def test_mapping_camelcase_string_keys_to_underscored_attribute_names
    value = 'United Kingdom'

    entity = Vonage::Entity.new
    entity['countryDisplayName'] = value

    assert_equal entity[:country_display_name], value
    assert_equal entity.country_display_name, value
  end

  def test_json_object_class
    entity = JSON.parse('{"value":100.00,"autoReload":false}', object_class: Vonage::Entity)

    assert_instance_of Vonage::Entity, entity
    assert_equal entity.value, 100
    assert_equal entity.auto_reload, false
  end

  def test_equal_to_other_entity_objects_with_same_attributes
    entity1 = Vonage::Entity.new(key: 'value')
    entity2 = Vonage::Entity.new(key: 'value')

    refute_equal entity1.object_id, entity2.object_id
    assert_equal entity1, entity2
  end

  def test_not_equal_to_other_objects
    entity = Vonage::Entity.new

    refute_equal entity, Object.new
  end

  def test_to_h_method_returns_attributes_hash
    value = 'xxxx-xxxx'

    entity = Vonage::Entity.new
    entity[:id] = value

    assert_equal entity.to_h, {id: value}
  end

  def test_respond_to_method
    entity1 = Vonage::Entity.new
    entity2 = Vonage::Entity.new(key: 'value')

    refute entity1.respond_to?(:key)
    assert entity2.respond_to?(:key)
  end

  def test_method_missing_method_raises_no_method_error
    entity = Vonage::Entity.new

    assert_raises(NoMethodError) { entity.key }
  end

  def test_enumerable
    entity = Vonage::Entity.new(key: 'value')

    assert_equal [[:key, 'value']], entity.each.map(&:to_a)
  end
end
