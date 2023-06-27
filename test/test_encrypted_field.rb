# frozen_string_literal: true

require './lib/encrypted_field'

class TestEncryptedField < Minitest::Test
  def test_initialize
    encrypted_field = EncryptedField.new

    assert_equal(encrypted_field.fields, [])
    assert_equal(encrypted_field.auto_decrypt, false)
    assert_equal(encrypted_field.secret_key, nil)
  end

  def test_encrypt_field
    secret_key = "Aswertyuioasdfghjkqwertyuiqwerty"
    encrypted_field = EncryptedField.new(fields: [ { name: 'foo', value: 'bar' } ], secret_key: secret_key)

    assert_equal(encrypted_field.encrypt_field(encrypted_field.fields[0]),
                 'oYQSxlWVMwigi9apzw==--FnoVavjgmVCdRBlX--L+FlLb9iI2klllAe3hVQPQ==')
  end
end
