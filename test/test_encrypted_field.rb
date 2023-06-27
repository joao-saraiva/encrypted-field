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

  def test_decrypt_field
    secret_key = "Aswertyuioasdfghjkqwertyuiqwerty"
    encrypted_field = EncryptedField.new(fields: [ { name: 'foo', value: 'bar' } ], secret_key: secret_key)
    encrypted_value = encrypted_field.encrypt_field(encrypted_field.fields[0])

    assert_equal(encrypted_field.decrypt_field(encrypted_value), 'bar')
  end

  def test_meta_decrypted_method
    secret_key = "Aswertyuioasdfghjkqwertyuiqwerty"
    encrypted_field = EncryptedField.new(fields: [ { name: 'foo', value: 'bar' } ], secret_key: secret_key)
    encrypted_value = encrypted_field.encrypt_field(encrypted_field.fields[0])

    assert_equal(encrypted_field.foo_decrypted, 'bar')
  end

  def test_field_get_override
    secret_key = "Aswertyuioasdfghjkqwertyuiqwerty"
    encrypted_field = EncryptedField.new(fields: [ { name: 'foo', value: 'bar' } ], secret_key: secret_key, auto_decrypt: true)
    encrypted_value = encrypted_field.encrypt_field(encrypted_field.fields[0])

    assert_equal(encrypted_field.foo, 'bar')
  end
end
