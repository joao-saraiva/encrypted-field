# frozen_string_literal: true

require "./lib/encrypted_field"

class TestEncryptedField < Minitest::Test
  def test_initialize
    encrypted_field = EncryptedField.new

    assert_equal(encrypted_field.fields, [])
    assert_equal(encrypted_field.auto_decrypt, false)
    assert_equal(encrypted_field.secret_key, nil)
  end
end
